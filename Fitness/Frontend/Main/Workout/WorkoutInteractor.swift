//
//  WorkoutInteractor.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/17/20.
//

import UIKit

class WorkoutInteractor {
    
    enum Data {
        case name
        case id
        case emoji
    }
    
    var selected: Workouts.ID? = nil
    var presenter: WorkoutPresenter?
    
    required init(from delegate: WorkoutPresenter) {
        self.presenter = delegate
    }
    
    func populateData(for cell: WorkoutCell, at index: Int) {
        cell.iconLabel.text = Workouts.list.map({ $0.emojiIcon })[index]
        cell.nameLabel.text = Workouts.list.map({ $0.title })[index]
        
        let isSelected = (selected == Workouts.list.map({ $0.id })[index])
        isSelected ? self.presenter?.cellIsSelected(cell) : self.presenter?.cellNotSelected(cell)
    }
    
    func select(_ collectionView: UICollectionView, at index: Int) {
        self.selected = Workouts.list.map({ $0.id })[index]
        self.presenter?.onSelect(selected: self.selected)
    }
}
