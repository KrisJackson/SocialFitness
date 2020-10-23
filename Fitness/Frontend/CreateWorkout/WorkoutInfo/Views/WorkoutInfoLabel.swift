//
//  WorkoutInfoLabel.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/23/20.
//

import UIKit

class WorkoutInfoLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.font = .systemFont(ofSize: 18, weight: .semibold)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
