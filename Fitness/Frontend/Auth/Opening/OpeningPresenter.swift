//
//  OpeningPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/7/20.
//

import Foundation

class OpeningPresenter {
    
    var view: OpeningView!
    lazy var router: OpeningRouter = OpeningRouter(from: self)
    lazy var interactor: OpeningInteractor = OpeningInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: OpeningView = delegate as? OpeningView {
            self.view = view
        }
        
        if let interactor: OpeningInteractor = delegate as? OpeningInteractor {
            self.interactor = interactor
        }
        
    }
    
    func routeToLogin() {
        self.router.route(to: .login)
    }
    
    func routeToSignUp() {
        self.router.route(to: .getInfo)
    }
    
}
