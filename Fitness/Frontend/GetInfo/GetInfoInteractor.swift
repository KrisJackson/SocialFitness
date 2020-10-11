//
//  SignUpInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import Firebase

class GetInfoInteractor {
    
    var presenter: GetInfoPresenter!
    
    required init(from delegate: GetInfoPresenter) {
        self.presenter = delegate
    }
    
    func validate(name n: String, email e: String, dateOfBirth d: String) {
        
        let name = n.trimmingCharacters(in: .whitespacesAndNewlines)
        let email = e.trimmingCharacters(in: .whitespacesAndNewlines)
        let date = d.trimmingCharacters(in: .whitespacesAndNewlines)
        
        /// Handles email error
        self.valid(email: email) { (error) in
            
            if let error = error {
                self.presenter.onCollectError(error)
                return
            }
                
            /// Handles name error
            if let error = self.valid(name: name) {
                self.presenter.onCollectError(error)
                return
            }
            
            /// Handles date error
            if let error = self.valid(date: date) {
                self.presenter.onCollectError(error)
                return
            }
            
            /// Formats the date to be passed as a timestamp
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy"
            guard let formatedDate = formatter.date(from: date) else {
                self.presenter.onCollectError(GetInfoError.invalidDate)
                return
            }
            
            let user = UserStore()
            user.name = name
            user.email = email
            user.dateOfBirth = formatedDate.timeIntervalSince1970
            
            self.presenter.onCollectSuccess(user: user)
            
        }
        
    }
    
    
    /// Checks if name format is valid
    private func valid(name: String) -> Error? {
        if name.isEmpty {
            return GetInfoError.empty
        }
        
        if name.count > 100 {
            return GetInfoError.nameTooLong
        }
        
        return nil
    }
    
    
    /// Checks if the email format is valid
    private func valid(email: String, completion: @escaping(_ error: Error?) -> Void) {
        if email.isEmpty {
            completion(GetInfoError.empty)
            return
        }
        
        let validChar = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", validChar)
        if !emailPredicate.evaluate(with: email) {
            completion(GetInfoError.invalidEmail)
            return
        }
        
        Firestore.firestore().collection("users")
            .whereField("email", isEqualTo: email)
            .getDocuments { (snapshot, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(error)
                        return
                    }
                    
                    guard let snapshot = snapshot else {
                        completion(GetInfoError.general)
                        return
                    }
                    
                    snapshot.isEmpty ? completion(nil) : completion(GetInfoError.emailTaken)
                    return
                }
        }
        
        return
    }
    
    /// Checks if date format is valid
    private func valid(date: String) -> Error? {
        if date.isEmpty {
            return GetInfoError.empty
        }
        
        return nil
    }
    
}
