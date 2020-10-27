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
            guard let workout: Workout = data as? Workout else {
                return
            }
            
            let storyboard = UIStoryboard(name: "Workout", bundle: Bundle.main)
            let vc = storyboard.instantiateViewController(withIdentifier: "WorkoutInfoView") as! WorkoutInfoView
            vc.workout = workout
            self.presenter?.view.navigationController?.pushViewController(vc, animated: true)
            break
        case .previous:
            self.presenter?.view.dismiss(animated: true, completion: nil)
            break
        }
    }
    
}
