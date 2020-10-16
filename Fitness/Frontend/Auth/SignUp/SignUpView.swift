//
//  MoreInfoView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/10/20.
//


import UIKit

class SignUpView: UIViewController {
    
    @IBOutlet weak var tintView: UIView!
    @IBOutlet weak var legalLabelView: UILabel!
    @IBOutlet weak var errorLabelView: UILabel!
    @IBOutlet weak var headerLabelView: UILabel!
    @IBOutlet weak var backButtonView: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var signUpButtonView: UIButton!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var confirmContainerView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var usernameContainerView: UIView!
    @IBOutlet weak var passwordTextFieldView: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var usernameTextFieldView: UITextField!
    @IBOutlet weak var confirmTextFieldView: UITextField!
    
    var user: UserStore!
    lazy var presenter: SignUpPresenter = SignUpPresenter(from: self)
    
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
        errorLabelView.font = .systemFont(ofSize: 14, weight: .medium)
        
        /// Configure header label
        headerLabelView.numberOfLines = 1
        headerLabelView.textColor = .white
        headerLabelView.text = "Create Your Account"
        headerLabelView.font = .systemFont(ofSize: 26, weight: .heavy)
        
        /// Configure scroll view
        scrollView.isScrollEnabled = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.setContentOffset(.zero, animated: true)
        
        /// Configure username textfield
        usernameTextFieldView.borderStyle = .none
        usernameTextFieldView.placeholder = "Username"
        usernameTextFieldView.textContentType = .username
        usernameTextFieldView.keyboardType = .namePhonePad
        usernameTextFieldView.clearButtonMode = .whileEditing
        usernameTextFieldView.overrideUserInterfaceStyle = .dark
        usernameTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure password textfield
        passwordTextFieldView.borderStyle = .none
        passwordTextFieldView.keyboardType = .default
        passwordTextFieldView.isSecureTextEntry = true
        passwordTextFieldView.placeholder = "Password"
        passwordTextFieldView.clearsOnBeginEditing = true
        passwordTextFieldView.textContentType = .newPassword
        passwordTextFieldView.clearButtonMode = .whileEditing
        passwordTextFieldView.overrideUserInterfaceStyle = .dark
        passwordTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure confirm password textfield
        confirmTextFieldView.borderStyle = .none
        confirmTextFieldView.keyboardType = .default
        confirmTextFieldView.isSecureTextEntry = true
        confirmTextFieldView.clearsOnBeginEditing = true
        confirmTextFieldView.placeholder = "Confirm Password"
        confirmTextFieldView.textContentType = .newPassword
        confirmTextFieldView.clearButtonMode = .whileEditing
        confirmTextFieldView.overrideUserInterfaceStyle = .dark
        confirmTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure username container
        usernameContainerView.layer.cornerRadius = 8
        usernameContainerView.layer.masksToBounds = true
        usernameContainerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure password container
        passwordContainerView.layer.cornerRadius = 8
        passwordContainerView.layer.masksToBounds = true
        passwordContainerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure confirm password container
        confirmContainerView.layer.cornerRadius = 8
        confirmContainerView.layer.masksToBounds = true
        confirmContainerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure sign up button
        signUpButtonView.backgroundColor = .systemPink
        signUpButtonView.setTitle("Sign Up", for: .normal)
        signUpButtonView.setTitleColor(.white, for: .normal)
        signUpButtonView.layer.cornerRadius = signUpButtonView.frame.height / 2
        signUpButtonView.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
        /// Configure legal label
        legalLabelView.textColor = .placeholderText
        legalLabelView.overrideUserInterfaceStyle = .dark
        legalLabelView.font = .systemFont(ofSize: 13, weight: .medium)
        legalLabelView.text = "By signing up, you acknowledge that you have read, understand, and agree to our Terms of Service and Privacy Policy."
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillAppear),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillDisappear),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
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
}

// MARK: - Actions

extension SignUpView {
    
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
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        /// Dispatch router
        self.presenter.routeToPreviousPage()
    }
    
    
    @IBAction func signUpPressed(_ sender: Any) {
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        user.created = NSDate().timeIntervalSince1970
        user.username = usernameTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let password = passwordTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let confirmPassword = confirmTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        self.presenter.signUp(user: user, password: password, confirmPassword: confirmPassword)
 
    }
    
    
}


// MARK: - Presenter Response

extension SignUpView {
    
    func onSuccess(user: UserStore) {
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        self.presenter.routeToHome()
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

