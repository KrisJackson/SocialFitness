//
//  WorkoutInfoPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import Foundation

class WorkoutInfoPresenter {
    
    var view: WorkoutInfoView!
    lazy var router: WorkoutInfoRouter = WorkoutInfoRouter(from: self)
    lazy var interactor: WorkoutInfoInteractor = WorkoutInfoInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: WorkoutInfoView = delegate as? WorkoutInfoView {
            self.view = view
        }
        
        if let interactor: WorkoutInfoInteractor = delegate as? WorkoutInfoInteractor {
            self.interactor = interactor
        }
        
    }
    
    // MARK: - Router Functions
    
    func routeToDescription(withData data: Any) {
        
        
    }
    
}
