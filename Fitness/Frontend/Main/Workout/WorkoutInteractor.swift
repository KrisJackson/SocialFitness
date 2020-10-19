//
//  WorkoutInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import Foundation

class WorkoutInteractor {
    
    var presenter: WorkoutPresenter?
    
    required init(from delegate: WorkoutPresenter) {
        self.presenter = delegate
    }
    
    
}
