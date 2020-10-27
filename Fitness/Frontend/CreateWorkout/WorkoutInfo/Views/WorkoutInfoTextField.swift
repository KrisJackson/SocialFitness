//
//  WorkoutInfoTextField.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/23/20.
//

import UIKit


class WorkoutInfoTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.adjustsFontSizeToFitWidth = false
        self.autocapitalizationType = .words
        self.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
