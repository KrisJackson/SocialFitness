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
        
        if (email.isEmpty || password.isEmpty) {
            self.presenter?.onLogInError(LoginError.empty)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (auth, error) in
            if let error = error {
                self.presenter?.onLogInError(error)
                return
            }
            
            // Success! Get user info
            
        }
        
    }
    
}
