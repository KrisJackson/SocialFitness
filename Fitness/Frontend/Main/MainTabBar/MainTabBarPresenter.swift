//
//  MainTabBarPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Foundation

class MainTabBarPresenter {
    
    var view: MainTabBarView!
    lazy var router: MainTabBarRouter = MainTabBarRouter(from: self)
    lazy var interactor: MainTabBarInteractor = MainTabBarInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: MainTabBarView = delegate as? MainTabBarView {
            self.view = view
        }
        
        if let interactor: MainTabBarInteractor = delegate as? MainTabBarInteractor {
            self.interactor = interactor
        }
        
    }
    
    // MARK: - ROUTER
    
    func routeToAuth() {
        self.router.route(to: .auth)
    }
    
}

