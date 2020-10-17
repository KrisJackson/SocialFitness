//
//  LoginInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import Firebase

class LoginInteractor {
    
    var presenter: LoginPresenter?
    
    required init(from delegate: LoginPresenter) {
        self.presenter = delegate
    }
    
    func login(withEmail email: String, password: String) {
        
        /// Check credentials
        if (email.isEmpty || password.isEmpty) {
            self.presenter?.onLogInError(LoginError.empty)
            return
        }
        
        /// Sign in user
        Auth.auth().signIn(withEmail: email, password: password) { (auth, error) in
            if let error = error {
                self.presenter?.onLogInError(error)
                return
            }
            
            /// Auth `nil` with no error
            guard let auth = auth else {
                self.presenter?.onLogInError(LoginError.general)
                return
            }
            
            /// Gets user data
            self.getUser(uid: auth.user.uid)
        }
    }
    
    
    /// Gets the user data from Firestore
    private func getUser(uid: String) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { (snapshot, error) in
                
                /// Error
                if let error = error {
                    self.presenter?.onLogInError(error)
                    return
                }
                
                /// Snapshot `nil` with no error
                guard let snapshot = snapshot else {
                    self.presenter?.onLogInError(LoginError.general)
                    return
                }
                
                /// Data is `nil` with no errors
                guard let data = snapshot.data() else {
                    self.presenter?.onLogInError(LoginError.general)
                    return
                }
                
                let user = UserStore()
                user._id = snapshot.documentID
                user.name = data["name"] as? String
                user.email = data["email"] as? String
                user.created = data["created"] as? Double
                user.username = data["username"] as? String
                user.dateOfBirth = data["dateOfBirth"] as? Double
                user.reference = data["reference"] as? DocumentReference
                
                self.presenter?.onLogInSuccess(withUser: user)
            }
    }
    
}
