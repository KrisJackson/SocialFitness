//
//  LoginPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import Foundation

class LoginPresenter {
    
    var view: LoginView!
    lazy var router: LoginRouter = LoginRouter(from: self)
    lazy var interactor: LoginInteractor = LoginInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: LoginView = delegate as? LoginView {
            self.view = view
        }
        
        if let interactor: LoginInteractor = delegate as? LoginInteractor {
            self.interactor = interactor
        }
        
    }
    
    func login(withEmail email: String, password: String) {
        self.interactor.login(withEmail: email, password: password)
    }
    
    func routeToPreviousPage() {
        self.router.route(to: .previous)
    }
    
}
