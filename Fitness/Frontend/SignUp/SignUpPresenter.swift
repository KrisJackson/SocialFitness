//
//  MoreInfoPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/10/20.
//

import Foundation

class SignUpPresenter {
    
    var view: SignUpView!
    lazy var router: SignUpRouter = SignUpRouter(from: self)
    lazy var interactor: SignUpInteractor = SignUpInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: SignUpView = delegate as? SignUpView {
            self.view = view
        }
        
        if let interactor: SignUpInteractor = delegate as? SignUpInteractor {
            self.interactor = interactor
        }
        
    }
    
    
    // MARK: - ROUTER FUNCTIONS
    
    
    func routeToPreviousPage() {
        self.router.route(to: .previous)
    }
    
    
}
