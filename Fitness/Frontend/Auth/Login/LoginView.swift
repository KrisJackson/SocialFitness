//
//  LoginView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import UIKit

class LoginView: UIViewController {
    
    @IBOutlet weak var tintView: UIView!
    @IBOutlet weak var errorLabelView: UILabel!
    @IBOutlet weak var headerLabelView: UILabel!
    @IBOutlet weak var backButtonView: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginButtonView: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var passwordContainerVIew: UIView!
    @IBOutlet weak var emailTextFieldView: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var passwordTextFieldView: UITextField!
    @IBOutlet weak var forgotPasswordButtonView: UIButton!
    
    lazy var presenter: LoginPresenter = LoginPresenter(from: self)
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
          return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Configure super view
        /// Add rounded corners to iPhone X family
        if keyWindow?.safeAreaInsets.bottom ?? 0 > 0 {
            self.view.layer.cornerRadius = 40
            self.view.layer.masksToBounds = true
        }
        
        /// Configure tint view
        tintView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.0)
        
        /// Configure blur view on background image
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        backgroundImageView.addSubview(blurEffectView)
        backgroundImageView.sendSubviewToBack(blurEffectView)
        
        /// Configure logo image
        logoImageView.tintColor = UIColor.white
        logoImageView.image = UIImage(systemName: "leaf.fill")
        
        /// Configure error label view
        errorLabelView.text = nil
        errorLabelView.numberOfLines = 5
        errorLabelView.textColor = UIColor.systemPink
        errorLabelView.font = .systemFont(ofSize: 16, weight: .medium)
        
        /// Configure header label
        headerLabelView.numberOfLines = 1
        headerLabelView.textColor = .white
        headerLabelView.text = "Welcome Back"
        headerLabelView.font = .systemFont(ofSize: 26, weight: .heavy)
        
        /// Configure scroll view
        scrollView.isScrollEnabled = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.setContentOffset(.zero, animated: true)
        
        /// Configure email textfield
        emailTextFieldView.borderStyle = .none
        emailTextFieldView.keyboardType = .emailAddress
        emailTextFieldView.placeholder = "Email"
        emailTextFieldView.textContentType = .emailAddress
        emailTextFieldView.clearButtonMode = .whileEditing
        emailTextFieldView.overrideUserInterfaceStyle = .dark
        emailTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure password textfield
        passwordTextFieldView.borderStyle = .none
        passwordTextFieldView.keyboardType = .default
        passwordTextFieldView.placeholder = "Password"
        passwordTextFieldView.isSecureTextEntry = true
        passwordTextFieldView.clearsOnBeginEditing = true
        passwordTextFieldView.textContentType = .password
        passwordTextFieldView.clearButtonMode = .whileEditing
        passwordTextFieldView.overrideUserInterfaceStyle = .dark
        passwordTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure email container
        emailContainerView.layer.cornerRadius = 8
        emailContainerView.layer.masksToBounds = true
        emailContainerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure password container
        passwordContainerVIew.layer.cornerRadius = 8
        passwordContainerVIew.layer.masksToBounds = true
        passwordContainerVIew.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure login button
        loginButtonView.backgroundColor = .systemPink
        loginButtonView.setTitle("Log In", for: .normal)
        loginButtonView.setTitleColor(.white, for: .normal)
        loginButtonView.layer.cornerRadius = loginButtonView.frame.height / 2
        loginButtonView.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        /// Configure forgot password button
        forgotPasswordButtonView.overrideUserInterfaceStyle = .dark
        forgotPasswordButtonView.setTitle("Forgot password?", for: .normal)
        forgotPasswordButtonView.setTitleColor(.placeholderText, for: .normal)
        forgotPasswordButtonView.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        
        scrollView.setContentOffset(.zero, animated: true)
        
    }
    
    @objc private func keyboardWillAppear() {
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        scrollView.isScrollEnabled = true
        scrollView.setContentOffset(.zero, animated: true)
        
    }
    
    @objc private func keyboardWillDisappear() {
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        scrollView.isScrollEnabled = false
        scrollView.setContentOffset(.zero, animated: true)
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func backPressed(_ sender: Any) {
        self.presenter.routeToPreviousPage()
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        let email = emailTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines)
        
        self.presenter.logIn(withEmail: (email ?? ""), password: (password ?? ""))
        
    }
    
}

// MARK: - Presenter Response

extension LoginView {
    
    func onSuccess(user: UserStore) {
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        print("Success - Email: \(user.email ?? ""); Username: \(user.username ?? "")")
        self.presenter.dismiss()
        
    }
    
    func onError(_ error: Error) {
        Vibration.vibrate(type: .error)
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = error.localizedDescription
            self.view.layoutIfNeeded()
        }
    }
    
}
