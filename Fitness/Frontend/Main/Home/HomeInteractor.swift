//
//  HomeInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import Foundation

class HomeInteractor {
    
    var presenter: HomePresenter?
    
    required init(from delegate: HomePresenter) {
        self.presenter = delegate
    }

}
