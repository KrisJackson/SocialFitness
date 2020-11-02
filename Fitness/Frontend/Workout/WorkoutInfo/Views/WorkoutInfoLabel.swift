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
        self.textColor = .darkGray
        self.text = self.text?.uppercased()
        self.font = .systemFont(ofSize: 12, weight: .bold)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
