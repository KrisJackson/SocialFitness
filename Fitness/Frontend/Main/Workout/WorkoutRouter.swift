//
//  WorkoutRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

class WorkoutRouter {
    
    enum Destination {
        case workoutInfo
        case previous
    }
    
    private var presenter: WorkoutPresenter?
    
    required init(from delegate: WorkoutPresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .workoutInfo:
            break
        case .previous:
            self.presenter?.view.dismiss(animated: true, completion: nil)
            break
        }
    }
    
}
