//
//  TabBarInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/14/20.
//

import Foundation

class TabBarInteractor {
    
    var presenter: TabBarPresenter!
    
    required init(from delegate: TabBarPresenter) {
        self.presenter = delegate
    }
    
}
