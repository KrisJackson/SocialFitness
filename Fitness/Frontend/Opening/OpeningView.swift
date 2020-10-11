//
//  ViewController.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/7/20.
//

import UIKit

class OpeningView: UIViewController {
    
    @IBOutlet weak var tintView: UIView!
    @IBOutlet weak var loginLabelView: UILabel!
    @IBOutlet weak var missionLabelView: UILabel!
    @IBOutlet weak var logInButtonView: UIButton!
    @IBOutlet weak var signUpButtonView: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    lazy var presenter: OpeningPresenter = OpeningPresenter(from: self)

    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Configure tint view
        tintView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        /// Configure background image
        backgroundImageView.image = UIImage(named: "Workout")
        backgroundImageView.contentMode = .scaleAspectFill
        
        /// Configure logo image
        logoImageView.tintColor = UIColor.white
        logoImageView.image = UIImage(systemName: "leaf.fill")
        
        /// Configure mission label view
        missionLabelView.text = "Share your\nfinest workouts\nwith the world."
        missionLabelView.font = .systemFont(ofSize: 36, weight: .heavy)
        
        /// Configure sign up button view
        signUpButtonView.backgroundColor = .systemPink
        signUpButtonView.setTitleColor(.white, for: .normal)
        signUpButtonView.setTitle("Get Started", for: .normal)
        signUpButtonView.layer.cornerRadius = signUpButtonView.frame.height / 2
        signUpButtonView.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        /// Configure log in label
        loginLabelView.textColor = .white
        loginLabelView.text = "Already have an account?"
        loginLabelView.font = .systemFont(ofSize: 16, weight: .semibold)
        
        /// Configure log in button
        logInButtonView.setTitle("Log In", for: .normal)
        logInButtonView.setTitleColor(.systemPink, for: .normal)
        logInButtonView.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        
        /// Enables 'slide to dismiss' for views added to stack
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        self.presenter.routeToLogin()
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        self.presenter.routeToSignUp()
    }
    
}


// MARK: - UIGesture Recognizer Delegate

extension OpeningView: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        /// Prevents 'slide to dismis' for view on the root of stack
        if(navigationController!.viewControllers.count > 1) {
            return true
        }
        return false
    }
    
}
