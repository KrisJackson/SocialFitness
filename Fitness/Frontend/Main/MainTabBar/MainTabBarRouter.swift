//
//  MainTabBarRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Foundation

class MainTabBarRouter {
    
    enum Destination {
        case auth
    }
    
    private var presenter: MainTabBarPresenter?
    
    required init(from delegate: MainTabBarPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .auth:
            break
        }
    }

}
