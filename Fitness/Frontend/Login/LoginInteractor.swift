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
        print("login")
    }
    
}
