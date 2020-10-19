//
//  WorkoutCell.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/18/20.
//

import UIKit

class WorkoutCell: UICollectionViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let reuseId = "WorkoutCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Configure background view
        self.backView.layer.cornerRadius = 10
        self.backView.backgroundColor = .secondarySystemBackground
        
    }
}
