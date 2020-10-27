//
//  WorkoutInfoInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import Foundation

class WorkoutInfoInteractor {

    var presenter: WorkoutInfoPresenter?

    required init(from delegate: WorkoutInfoPresenter) {
        self.presenter = delegate
    }

}
