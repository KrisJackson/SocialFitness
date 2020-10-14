//
//  MainTabBarInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Foundation

class MainTabBarInteractor {
    
    var presenter: MainTabBarPresenter!
    
    required init(from delegate: MainTabBarPresenter) {
        self.presenter = delegate
    }
    
}
