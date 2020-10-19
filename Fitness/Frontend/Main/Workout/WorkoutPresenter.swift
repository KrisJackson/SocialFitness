//
//  WorkoutPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import Foundation

class WorkoutPresenter {
    
    var view: WorkoutView!
    lazy var router: WorkoutRouter = WorkoutRouter(from: self)
    lazy var interactor: WorkoutInteractor = WorkoutInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: WorkoutView = delegate as? WorkoutView {
            self.view = view
        }
        
        if let interactor: WorkoutInteractor = delegate as? WorkoutInteractor {
            self.interactor = interactor
        }
        
    }
    
    // MARK: - Router Functions
    
    func routeToPrevious() {
        self.router.route(to: .previous)
    }

}
