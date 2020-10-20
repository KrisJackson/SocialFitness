//
//  HomePresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import Foundation

class HomePresenter {
        
    var view: HomeView!
    lazy var router: HomeRouter = HomeRouter(from: self)
    lazy var interactor: HomeInteractor = HomeInteractor(from: self)
    
    required init(from delegate: Any) {
        
        if let view: HomeView = delegate as? HomeView {
            self.view = view
        }
        
        if let interactor: HomeInteractor = delegate as? HomeInteractor {
            self.interactor = interactor
        }
        
    }

    // MARK: - Router Functions
    
    func routeToWorkout() {
        self.router.route(to: .workout)
    }
    
}
