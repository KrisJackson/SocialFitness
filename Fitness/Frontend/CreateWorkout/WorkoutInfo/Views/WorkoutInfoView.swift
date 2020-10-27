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
    
    @IBOutlet weak var titleTextField: WorkoutInfoTextField!
    @IBOutlet weak var descTextField: WorkoutInfoTextField!
    
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
        
        /// Configure title textfield
        self.titleTextField.tag = 0
        self.titleTextField.delegate = self
        self.titleTextField.text = self.workout.title ?? ""
        self.titleTextField.placeholder = "Name your workout"
        
        /// Configure description textfield
        self.descTextField.tag = 1
        self.descTextField.delegate = self
        self.descTextField.text = self.workout.desc ?? ""
        self.descTextField.placeholder = "Add a description"
        
        /// Configure done button
        self.doneButton.backgroundColor = .systemPink
        self.doneButton.layer.cornerRadius = doneButton.frame.height / 2
        self.doneButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
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


// MARK: - UITextField Delegate


extension WorkoutInfoView: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch textField.tag {
        case 0:
            
            textField.text!.isEmpty ? (self.workout.title = nil) : (self.workout.title = textField.text)
            break
            
        default:
            break
        }
    }
    
}


// MARK: - Actions


extension WorkoutInfoView {
    
    @IBAction func fieldPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
