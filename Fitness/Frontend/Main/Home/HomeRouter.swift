//
//  HomeRouter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

class HomeRouter {
    
    enum Destination {
        case workout
        case message
    }
    
    private var presenter: HomePresenter?
    
    required init(from delegate: HomePresenter) {
        self.presenter = delegate
    }
    
    func route(to destination: Destination, withData data: Any? = nil) {
        switch destination {
        case .workout:
            let storyboard = UIStoryboard(name: "Workout", bundle: .main)
            let vc = storyboard.instantiateViewController(withIdentifier: "WorkoutNavView") as! WorkoutNavView
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.presenter?.view.present(vc, animated: true, completion: nil)
            break
        case .message:
            break
        }
    }
    
}
