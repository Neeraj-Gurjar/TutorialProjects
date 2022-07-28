//
//  ViewController.swift
//  CustomViewDemo
//
//  Created by bitcot on 27/06/22.
//

import UIKit

enum CustomViewOptions{
    case fullName, email, mobile, address, dateOfBirth, password, confirmPassword
    
    var placeHolder:String{
        switch self {
        case .fullName:
            return "Enter Full Name"
        case .email:
            return "Enter Email Address"
        case .mobile:
            return "Enter Mobile No."
        case .address:
            return "Enter Address"
        case .dateOfBirth:
            return "Enter Date Of Birth"
        case .password:
            return "Enter PassWord"
        case .confirmPassword:
            return "Enter Confirm Password"
        }
    }
    
    var emptyErrorMessage:String{
        switch self {
        case .fullName:
            return "Please enter your full name"
        case .email:
            return "Please enter your Email"
        case .mobile:
            return "Please enter your Mobile No."
        case .address:
            return "Please enter your Address"
        case .dateOfBirth:
            return "Please enter your DOB"
        case .password:
            return "Please enter password"
        case .confirmPassword:
            return "Please enter confirm password"
        }
    }
    
    var validationErrorMessage:String{
        switch self {
        case .fullName:
            return ""
        case .email:
            return "Please enter valid Email"
        case .mobile:
            return "Phone number should be in formatted properly"
        case .address:
            return ""
        case .dateOfBirth:
            return ""
        case .password:
            return "Password needs to have min of 8 chars, 1 Cap, 1 special char, 1 number"
        case .confirmPassword:
            return "Password's not matched"
        }
    }
}

class ViewController: UIViewController {
    
    @IBOutlet weak var fullNameVw: UIView!
    @IBOutlet weak var emailVw: UIView!
    @IBOutlet weak var mobileNoVw: UIView!
    @IBOutlet weak var addressVw: UIView!
    @IBOutlet weak var dateOfBirthVw: UIView!
    @IBOutlet weak var passwordVw: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var signUpbtnVw:UIView!
    @IBOutlet weak var signUpbtn:UIButton!
    @IBOutlet weak var signUpBtnCenterConstraints: NSLayoutConstraint!
    
    
    @IBOutlet weak var passwordContainerViewHeightConstraint: NSLayoutConstraint!
    
    var name : CustomView!
    var email:CustomView!
    var mobile:CustomView!
    var address:CustomView!
    var dateOfBirth:CustomView!
    var password:CustomView!
    var confirmPassword:CustomView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCustomVw()
        signUpbtn.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateClouds()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signUpbtn.layer.cornerRadius = 15
    }
    
    private func animateClouds() {

        UIView.animate(withDuration: 1,
                       delay: 0.5,
                       options: [],
                       animations: { [weak self] in
                        self?.view.layoutIfNeeded()
          }, completion: nil)
    }
    
    func setUpCustomVw(){
        
        name = CustomView.loadview(frame: fullNameVw.bounds)
        name.configureView(headingtitle: CustomViewOptions.fullName.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        fullNameVw.addSubview(name)
        email = CustomView.loadview(frame: emailVw.bounds)
        email.configureView(headingtitle: CustomViewOptions.email.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        emailVw.addSubview(email)
        mobile = CustomView.loadview(frame: mobileNoVw.bounds)
        mobile.configureView(headingtitle: CustomViewOptions.mobile.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        mobileNoVw.addSubview(mobile)
        address = CustomView.loadview(frame: addressVw.bounds)
        address.configureView(headingtitle: CustomViewOptions.address.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        addressVw.addSubview(address)
        dateOfBirth = CustomView.loadview(frame: dateOfBirthVw.bounds)
        dateOfBirth.configureView(headingtitle: CustomViewOptions.dateOfBirth.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        dateOfBirthVw.addSubview(dateOfBirth)
        password = CustomView.loadview(frame: passwordVw.bounds)
        password.configureView(headingtitle: CustomViewOptions.password.placeHolder, messagetitle: "", messagefield: true, eyeView: false, borderColor: UIColor.white.cgColor, isSecuredText: true)
        password.passSecureEntry = false
        password.tag = 1
        password.delegate = self
        passwordVw.addSubview(password)
        confirmPassword = CustomView.loadview(frame: confirmPasswordView.bounds)
        confirmPassword.configureView(headingtitle: CustomViewOptions.confirmPassword.placeHolder, messagetitle: "", messagefield: true, eyeView: false, borderColor: UIColor.white.cgColor, isSecuredText: true)
        confirmPassword.confirmPassEntry = false
        confirmPassword.tag = 2
        confirmPassword.delegate = self
        confirmPasswordView.addSubview(confirmPassword)
    }
    
    @objc func signUp(){
        if name.textField.text?.isEmpty ?? false{
            name.configureView(headingtitle: CustomViewOptions.fullName.placeHolder, messagetitle: CustomViewOptions.fullName.emptyErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else{
            name.configureView(headingtitle: CustomViewOptions.fullName.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        }
        if email.textField.text?.isEmpty ?? false{
            email.configureView(headingtitle: CustomViewOptions.email.placeHolder, messagetitle: CustomViewOptions.email.emptyErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else if !(email.textField.text?.isValidEmail ?? true){
            email.configureView(headingtitle: CustomViewOptions.email.placeHolder, messagetitle: CustomViewOptions.email.validationErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else{
            email.configureView(headingtitle: CustomViewOptions.email.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        }
        if mobile.textField.text?.isEmpty ?? false{
            mobile.configureView(headingtitle: CustomViewOptions.mobile.placeHolder, messagetitle: CustomViewOptions.mobile.emptyErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else if !(mobile.textField.text?.isPhoneNumber ?? true) {
            mobile.configureView(headingtitle: CustomViewOptions.mobile.placeHolder, messagetitle: CustomViewOptions.mobile.validationErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else{
            mobile.configureView(headingtitle: CustomViewOptions.mobile.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        }
        if address.textField.text?.isEmpty ?? false{
            address.configureView(headingtitle: CustomViewOptions.address.placeHolder, messagetitle: CustomViewOptions.address.emptyErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else{
            address.configureView(headingtitle: CustomViewOptions.address.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        }
        if dateOfBirth.textField.text?.isEmpty ?? false{
            dateOfBirth.configureView(headingtitle: CustomViewOptions.dateOfBirth.placeHolder, messagetitle: CustomViewOptions.dateOfBirth.emptyErrorMessage, messagefield: false, borderColor: UIColor.systemRed.cgColor)
            return
        }else{
            dateOfBirth.configureView(headingtitle: CustomViewOptions.dateOfBirth.placeHolder, messagetitle: "", messagefield: true, borderColor: UIColor.white.cgColor)
        }
        if password.textField.text?.isEmpty ?? false{
            password.configureView(headingtitle: CustomViewOptions.password.placeHolder, messagetitle: CustomViewOptions.password.emptyErrorMessage, messagefield: false, eyeView: false, borderColor: UIColor.systemRed.cgColor, isSecuredText: true)
            return
        }else if !(password.textField.text?.isPasswordValid ?? true){
            password.configureView(headingtitle: CustomViewOptions.password.placeHolder, messagetitle: CustomViewOptions.password.validationErrorMessage, messagefield: false, eyeView: false, borderColor: UIColor.systemRed.cgColor, isSecuredText: true)
            passwordContainerViewHeightConstraint.constant = 110
            return
        }else{
            password.configureView(headingtitle: CustomViewOptions.password.placeHolder, messagetitle: CustomViewOptions.password.validationErrorMessage, messagefield: true, eyeView: false, borderColor: UIColor.white.cgColor, isSecuredText: true)
            passwordContainerViewHeightConstraint.constant = 90
        }
        if confirmPassword.textField.text?.isEmpty ?? false{
            confirmPassword.configureView(headingtitle: CustomViewOptions.confirmPassword.placeHolder, messagetitle: CustomViewOptions.confirmPassword.emptyErrorMessage, messagefield: false, eyeView: false, borderColor: UIColor.systemRed.cgColor, isSecuredText: true)
            return
        }else{
            confirmPassword.configureView(headingtitle: CustomViewOptions.confirmPassword.placeHolder, messagetitle: "", messagefield: true, eyeView: false, borderColor: UIColor.white.cgColor, isSecuredText: true)
        }
        if password.textField.text != confirmPassword.textField.text{
            confirmPassword.configureView(headingtitle: CustomViewOptions.confirmPassword.placeHolder, messagetitle: CustomViewOptions.confirmPassword.validationErrorMessage, messagefield: false, eyeView: false, borderColor: UIColor.systemRed.cgColor, isSecuredText: true)
            return
        }else{
            confirmPassword.configureView(headingtitle: CustomViewOptions.confirmPassword.placeHolder, messagetitle: "", messagefield: true, eyeView: false, borderColor: UIColor.white.cgColor, isSecuredText: true)
        }
        print("SignUp")
    }
    
    func validateCustomTextField(cutomTextField:CustomView){
        if cutomTextField.textField.text?.isEmpty ?? false{
            cutomTextField.configureView(headingtitle: "", messagetitle: "", messagefield: false, borderColor: UIColor.white.cgColor)
            return
        }
    }
}


extension ViewController:CustomViewDelegate{
    func didTapOnPass(view: CustomView) {
        if view.tag == 1{
            if password.passSecureEntry == false{
                password.textField.isSecureTextEntry = false
            }else{
                password.textField.isSecureTextEntry = true
            }
            password.passSecureEntry = !password.passSecureEntry
        }
    }
    
    func didTapOnConfimr(view: CustomView) {
        if view.tag == 2{
            if confirmPassword.confirmPassEntry == false{
                confirmPassword.textField.isSecureTextEntry = false
            }else{
                confirmPassword.textField.isSecureTextEntry = true
            }
            confirmPassword.confirmPassEntry = !confirmPassword.confirmPassEntry
        }
    }
}

