//
//  WorkoutInfoView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/20/20.
//

import UIKit

class WorkoutInfoView: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var footerContainerView: UIView!
    @IBOutlet weak var descTextView: WorkoutInfoTextView!
    
    let font = UIFont.systemFont(ofSize: 20, weight: .medium)
    
    var workout: Workout!
    lazy var presenter = WorkoutInfoPresenter(from: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Configure super view
        /// Add rounded corners to iPhone X family
        if keyWindow?.safeAreaInsets.bottom ?? 0 > 0 {
            self.view.layer.cornerRadius = 40
            self.view.layer.masksToBounds = true
        }
        
        /// Conifigure header view
        self.headerContainerView.backgroundColor = .white
        
        /// Configure footer view
        self.footerContainerView.backgroundColor = .clear
        
        /// Configure back button
        self.backButton.tintColor = .black
        self.backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        
        /// Configure header label
        self.headerLabel.textColor = .black
        self.headerLabel.text = "Design your workout"
        self.headerLabel.font = .systemFont(ofSize: 18, weight: .black)
        
        /// Configure description text view
        self.descTextView.txtColor = .black
        self.descTextView.placeholderText = "Describe your workout"
        
        /// Configure done button
        self.doneButton.layer.shadowRadius = 2
        self.doneButton.layer.shadowOpacity = 1
        self.doneButton.backgroundColor = .systemPink
        self.doneButton.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.doneButton.layer.cornerRadius = doneButton.frame.height / 2
        self.doneButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.doneButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
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
