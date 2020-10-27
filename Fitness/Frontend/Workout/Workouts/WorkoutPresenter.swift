//
//  WorkoutPresenter.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

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
    
    // MARK: - Initialize UICollectionView Cell
    
    func populateData(for cell: WorkoutCell, at index: Int) {
        self.interactor.populateData(for: cell, at: index)
    }
    
    func cellIsSelected(_ cell: WorkoutCell) {
        self.view.cellIsSelected(cell)
    }
    
    func cellNotSelected(_ cell: WorkoutCell) {
        self.view.cellNotSelected(cell)
    }
    
    
    // MARK: - Cell Selected Action and Response
    
    func select(_ collectionView: UICollectionView, at index: Int) {
        self.interactor.select(collectionView, at: index)
    }
    
    func onSelect(selected: Workouts.ID?) {
        self.view.onSelect(selected: selected)
    }
    
    // MARK: - Router Functions
    
    func routeToGet(data type: Any) {
        
    }
    
    func routeToPrevious() {
        self.router.route(to: .previous)
    }
    
    func routeToWorkoutInfo(withData data: Any) {
        self.router.route(to: .workoutInfo, withData: data)
    }

}
