//
//  WorkoutInfoView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import UIKit

class WorkoutInfoView: UIViewController {
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var footerContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Configure super view
        /// Add rounded corners to iPhone X family
        if keyWindow?.safeAreaInsets.bottom ?? 0 > 0 {
            self.view.layer.cornerRadius = 40
            self.view.layer.masksToBounds = true
        }
        
        /// Configure done button
        self.doneButton.layer.cornerRadius = 12
        self.doneButton.backgroundColor = .systemPink
        
        /// Configure header container view
        self.headerContainerView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)
        self.headerContainerView.layer.shadowRadius = 3
        self.headerContainerView.layer.shadowOpacity = 1
        self.headerContainerView.layer.masksToBounds = false
        self.headerContainerView.layer.shadowOffset = CGSize(width: 0, height: 3)
        
        /// Configure footer container view
        self.footerContainerView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08)
        self.footerContainerView.layer.shadowRadius = 3
        self.footerContainerView.layer.shadowOpacity = 1
        self.footerContainerView.layer.masksToBounds = false
        self.footerContainerView.layer.shadowOffset = CGSize(width: 0, height: -3)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /// Configure super view
        /// Remove rounded corners to iPhone X family
        if keyWindow?.safeAreaInsets.bottom ?? 0 > 0 {
            self.view.layer.cornerRadius = 0
            self.view.layer.masksToBounds = true
        }
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        /// Configure super view
        /// Add rounded corners to iPhone X family
        if keyWindow?.safeAreaInsets.bottom ?? 0 > 0 {
            self.view.layer.cornerRadius = 40
            self.view.layer.masksToBounds = true
        }
        
    }
    
}


// MARK: - Actions


extension WorkoutInfoView {
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
