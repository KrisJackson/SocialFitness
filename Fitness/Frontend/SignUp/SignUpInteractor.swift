//
//  MoreInfoInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/10/20.
//

import Firebase

class SignUpInteractor {
    
    var presenter: SignUpPresenter!
    
    required init(from delegate: SignUpPresenter) {
        self.presenter = delegate
    }
    
    /// Creates an account for a new user
    func signUp(user: UserStore, password: String, confirmPassword confirm: String) {
        let username = user.username ?? ""
        
        self.valid(username: username) { (error) in
            if let error = error {
                
                /// Error if username is taken
                self.presenter.onSignUpError(error)
                return
                
            } else {
                
                /// Handles password error
                if let error = self.valid(password: password, confirmPassword: confirm) {
                    self.presenter.onSignUpError(error)
                    return
                }
                
                /// Registers new user
                self.register(user: user, password: password) { (user, error) in
                    
                    if let error = error {
                        self.presenter.onSignUpError(error)
                        return
                    }
                        
                    /// Store data in Firestore
                    user.reference!.setData(user.toDictionary(), merge: true)
                    
                    /// Send email verification
                    Auth.auth().currentUser?.sendEmailVerification(completion: nil)
                    
                    /// Sign up completed
                    self.presenter.onSignUpSuccess(withUser: user)
                    
                }
                
            }
        }
    }

    /// Checks if username format is valid
    private func valid(username: String, _ completion: @escaping (_ error: Error?) -> Void) {
        
        /// Completes with error if username is empty
        if username.isEmpty {
            completion(SignUpError.empty)
            return
        }
        
        /// Completes with error if the username is too short
        if username.count < 5 {
            completion(SignUpError.usernameTooShort)
            return
        }
            
        /// Completes with error if username is too long
        if username.count > 20 {
            completion(SignUpError.usernameTooLong)
            return
        }
        
        /// Checks for valid characters in username
        let validChar = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-."
        let characterset = CharacterSet(charactersIn: validChar)
        if username.rangeOfCharacter(from: characterset.inverted) != nil {
            completion(SignUpError.invalidUsername)
            return
        }
        
        /// Checks if username is taken
        self.usernameValidation(username) { (error) in
            completion(error)
            return
        }
        
    }
    
    
    /// Username must be unique
    private func usernameValidation(_ username: String, _ completion: @escaping (_ error: Error?) -> Void) {
        Firestore.firestore().collection("users")
            .whereField("username", isEqualTo: username)
            .getDocuments { (snapshot, error) in
                DispatchQueue.main.async {
                    
                    /// Complete with error
                    if let error = error {
                        completion(error)
                        return
                    }
                    
                    /// Complete snapshot is `nil` with no error
                    guard let snapshot = snapshot else {
                        completion(SignUpError.usernameIncomplete)
                        return
                    }
                    
                    /// Return `nil` if username is unique else return error
                    completion(snapshot.documents.isEmpty ? nil : SignUpError.usernameTaken)
                    return
                    
                }
            }
    }
    
    
    /// Checks if password format is valid
    private func valid(password: String, confirmPassword confirm: String) -> Error? {
        if password.isEmpty {
            return SignUpError.empty
        }
        
        if password != confirm {
            return SignUpError.passwordMatch
        }
        
        if password.count < 6 {
            return SignUpError.passwordTooShort
        }
        
        return nil
    }
    
    /// Creates a new user account
    private func register(user: UserStore, password: String, _ completion: @escaping (_ user: UserStore, _ error: Error?) -> Void) {
        Auth.auth().createUser(withEmail: user.email ?? "", password: password) { (result, error) in
            DispatchQueue.main.async {
                
                /// Complete with error
                if let error = error {
                    completion(user, error)
                    return
                }
                
                /// Result is `nil` with no error
                guard let result = result else {
                    completion(user, SignUpError.general)
                    return
                }
                
                /// Save userID and reference in memory
                user._id = result.user.uid
                user.reference = Firestore.firestore().collection("users").document(result.user.uid)
                
                /// Save data on device
                UserDefaults.standard.set(user._id, forKey: "_id")
                UserDefaults.standard.set(user.name, forKey: "name")
                UserDefaults.standard.set(user.email, forKey: "email")
                UserDefaults.standard.set(user.created, forKey: "created")
                UserDefaults.standard.set(user.username, forKey: "username")
                UserDefaults.standard.set(user.reference, forKey: "reference")
                UserDefaults.standard.set(user.dateOfBirth, forKey: "dateOfBirth")
                
                /// Complete with no error
                completion(user, nil)
                
            }
        }
    }

}
