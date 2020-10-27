//
//  WorkoutCell.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/18/20.
//

import UIKit

class WorkoutCell: UICollectionViewCell {
    
    static let reuseId = "WorkoutCell"
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var iconLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        // Configure background view
        self.backView.layer.cornerRadius = 10
        self.backView.backgroundColor = .secondarySystemBackground
        
        // Configure name label
        self.nameLabel.font = .systemFont(ofSize: 18, weight: .bold)
        
    }
}
