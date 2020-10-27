//
//  WorkoutInfoRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import UIKit

class WorkoutInfoRouter {
    
    enum Destination {
        case description
    }
    
    private var presenter: WorkoutInfoPresenter?

    required init(from delegate: WorkoutInfoPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .description:
            break
        }
    }
    
}
