//
//  OpeningInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/7/20.
//

import Foundation

class OpeningInteractor {
    
    var presenter: OpeningPresenter?
    
    required init(from delegate: OpeningPresenter) {
        self.presenter = delegate
    }
    
}
