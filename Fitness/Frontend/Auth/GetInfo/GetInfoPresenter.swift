//
//  SignUpPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import Foundation

class GetInfoPresenter {
    
    var view: GetInfoView!
    lazy var router: GetInfoRouter = GetInfoRouter(from: self)
    lazy var interactor: GetInfoInteractor = GetInfoInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: GetInfoView = delegate as? GetInfoView {
            self.view = view
        }
        
        if let interactor: GetInfoInteractor = delegate as? GetInfoInteractor {
            self.interactor = interactor
        }
        
    }
    
    // MARK: - Collect User Data
    
    
    func collect(name: String, email: String, dateOfBirth date: String) {
        self.interactor.validate(name: name, email: email, dateOfBirth: date)
    }
    
    func onCollectSuccess(user: UserStore) {
        self.view.onSuccess(user: user)
    }
    
    func onCollectError(_ error: Error) {
        self.view.onError(error)
    }
    
    
    // MARK: - ROUTER FUNCTIONS
    
    
    func routeToPreviousPage() {
        self.router.route(to: .previous)
    }
    
    func routeToSignUp(withUser user: UserStore) {
        self.router.route(to: .signUp, withData: user)
    }
    
}
