//
//  WorkoutInfoIcon.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/23/20.
//

import UIKit

class WorkoutInfoIcon: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tintColor = .black
        self.preferredSymbolConfiguration = .init(font: .systemFont(ofSize: 17, weight: .regular))
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
    
}
