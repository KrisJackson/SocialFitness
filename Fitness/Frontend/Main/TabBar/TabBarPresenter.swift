//
//  TabBarPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Foundation

class TabBarPresenter {
    
    var view: TabBarView!
    lazy var router: TabBarRouter = TabBarRouter(from: self)
    lazy var interactor: TabBarInteractor = TabBarInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: TabBarView = delegate as? TabBarView {
            self.view = view
        }
        
        if let interactor: TabBarInteractor = delegate as? TabBarInteractor {
            self.interactor = interactor
        }
        
    }
    
    // MARK: - ROUTER
    
    func routeToAuth() {
        self.router.route(to: .auth)
    }
    
}

