//
//  GetInfoView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/8/20.
//

import UIKit

class GetInfoView: UIViewController {
    
    @IBOutlet weak var tintView: UIView!
    @IBOutlet weak var errorLabelView: UILabel!
    @IBOutlet weak var headerLabelView: UILabel!
    @IBOutlet weak var backButtonView: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var continueButtonView: UIButton!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var fullNameContainerView: UIView!
    @IBOutlet weak var birthContainerVIew: UIView!
    @IBOutlet weak var emailTextFieldView: UITextField!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var fullNameTextFieldView: UITextField!
    @IBOutlet weak var birthTextFieldView: UITextField!
    
    lazy var presenter: GetInfoPresenter = GetInfoPresenter(from: self)
    
    let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.locale = .current
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.addTarget(self, action: #selector(updateTextFieldWithDate(_:)), for: .valueChanged)
        return datePicker
    }()
    
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
        
        /// Configure full name textfield
        fullNameTextFieldView.borderStyle = .none
        fullNameTextFieldView.textContentType = .name
        fullNameTextFieldView.placeholder = "Full Name"
        fullNameTextFieldView.keyboardType = .namePhonePad
        fullNameTextFieldView.clearButtonMode = .whileEditing
        fullNameTextFieldView.overrideUserInterfaceStyle = .dark
        fullNameTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure email textfield
        emailTextFieldView.borderStyle = .none
        emailTextFieldView.placeholder = "Email Address"
        emailTextFieldView.keyboardType = .emailAddress
        emailTextFieldView.textContentType = .emailAddress
        emailTextFieldView.clearButtonMode = .whileEditing
        emailTextFieldView.overrideUserInterfaceStyle = .dark
        emailTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure date of bith textfield
        birthTextFieldView.borderStyle = .none
        birthTextFieldView.inputView = datePicker
        birthTextFieldView.keyboardType = .default
        birthTextFieldView.placeholder = "Date of Birth"
        birthTextFieldView.clearButtonMode = .whileEditing
        birthTextFieldView.overrideUserInterfaceStyle = .dark
        birthTextFieldView.font = .systemFont(ofSize: 17, weight: .regular)
        
        /// Configure full name container
        fullNameContainerView.layer.cornerRadius = 8
        fullNameContainerView.layer.masksToBounds = true
        fullNameContainerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure email container
        emailContainerView.layer.cornerRadius = 8
        emailContainerView.layer.masksToBounds = true
        emailContainerView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure date of birth container
        birthContainerVIew.layer.cornerRadius = 8
        birthContainerVIew.layer.masksToBounds = true
        birthContainerVIew.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.12)
        
        /// Configure continue button
        continueButtonView.backgroundColor = .systemPink
        continueButtonView.setTitle("Next", for: .normal)
        continueButtonView.setTitleColor(.white, for: .normal)
        continueButtonView.layer.cornerRadius = continueButtonView.frame.height / 2
        continueButtonView.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        
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
        
        self.view.endEditing(true)
        scrollView.setContentOffset(.zero, animated: true)
    }
}

// MARK: - Actions

extension GetInfoView {
    
    @objc private func updateTextFieldWithDate(_ sender: Any?) {
        let picker = birthTextFieldView.inputView as? UIDatePicker
        
        if let date = picker?.date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM d, yyyy"
            self.birthTextFieldView.text = "\(formatter.string(from: date))"
        }
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
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        /// Dispatch router
        self.presenter.routeToPreviousPage()
    }
    
    
    @IBAction func continuePressed(_ sender: Any) {
        
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        let name = fullNameTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let email = emailTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        let date = birthTextFieldView.text?
            .trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
        
        self.presenter.collect(name: name, email: email, dateOfBirth: date)
 
    }
    
    
}

// MARK: - Presenter Response


extension GetInfoView {
    
    func onSuccess(user: UserStore) {
        /// Animate error transition
        UIView.animate(withDuration: 0.2) {
            self.errorLabelView.text = ""
            self.view.layoutIfNeeded()
        }
        
        self.presenter.routeToSignUp(withUser: user)
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
