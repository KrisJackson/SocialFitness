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
    
    var workout: Workout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Configure super view
        /// Add rounded corners to iPhone X family
        if keyWindow?.safeAreaInsets.bottom ?? 0 > 0 {
            self.view.layer.cornerRadius = 40
            self.view.layer.masksToBounds = true
        }
        
        /// Configure done button
        self.doneButton.backgroundColor = .systemPink
        self.doneButton.layer.cornerRadius = doneButton.frame.height / 2
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
    
    @IBAction func fieldPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Title")
            break
        case 1:
            print("Description")
            break
        case 2:
            print("Photos")
            break
        case 3:
            print("Equiptment")
            break
        case 4:
            print("Weight")
            break
        case 5:
            print("Distance")
            break
        case 6:
            print("Pace")
            break
        case 7:
            print("Speed")
            break
        case 8:
            print("Time Limit")
            break
        case 9:
            print("Time Limit")
            break
        case 10:
            print("Time Limit")
            break
        case 11:
            print("Time Limit")
            break
        default:
            break
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}