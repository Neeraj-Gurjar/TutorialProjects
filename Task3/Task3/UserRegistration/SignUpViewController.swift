//
//  SignUpViewController.swift
//  Task3
//
//  Created by bitcot on 11/06/22.
//

import UIKit
import IQKeyboardManager


class SignUpViewController: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak var tfFullName:UITextField!
    @IBOutlet weak var tfEmail:UITextField!
    @IBOutlet weak var tfMobileNumber:UITextField!
    @IBOutlet weak var tfDateOfBirth:UITextField!
    @IBOutlet weak var tfPassword:UITextField!
    @IBOutlet weak var imgPassEye:UIImageView!
    @IBOutlet weak var tfConfirmPassword:UITextField!
    @IBOutlet weak var imgConfirmPassEye:UIImageView!
    @IBOutlet weak var alreadyHaveAnAcc:UILabel!
    
    // Button outlet
    @IBOutlet weak var btnSignUp:UIButton!
    
    //Declare var and let
    var iconClickPass = true
    var iconClickConfirm = true
    var tfArray:[UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
        btnSignUp.layer.cornerRadius = 20
        ReUsableFunc.setUpColorInLabelText(textString: "Already have an account signIn!", colorOne: UIColor.systemGray, colorTwo: UIColor(named: colorCode.themeColor)!, forTextOne: "Already have an account", forTextTwo: "signIn!", setForLbl: alreadyHaveAnAcc)
        tfColorNormal()
    }
    
    //MARK:- IBActions
    
    @IBAction func btnASignIn(_ sender: UIButton) {
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    @IBAction func openDatePicker(_ sender: UIButton){
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "DateOfBirthViewController") as! DateOfBirthViewController
        nextVc.backController = self
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    @IBAction func btnAPassEye(_ sender: UIButton){
        
        ReUsableFunc.securityEye(textF: tfPassword, iconImage: imgPassEye, iconClick: iconClickPass)
        iconClickPass = !iconClickPass
        
    }
    
    @IBAction func btnAConfirmPassEye(_ sender: UIButton){
        
        ReUsableFunc.securityEye(textF: tfConfirmPassword, iconImage: imgConfirmPassEye, iconClick: iconClickConfirm)
        iconClickConfirm = !iconClickConfirm
        
    }
    
    @IBAction func btnASignUp(_ sender: UIButton){
        
        setupTextFields()
        signUpValidationCheck()
        
    }
    
    //MARK:- Function
    func setupTextFields(){
        
        tfArray = [tfFullName, tfEmail, tfMobileNumber, tfDateOfBirth, tfPassword, tfConfirmPassword]
        for i in tfArray{
            i.delegate = self
            i.layer.masksToBounds = true
            i.layer.borderWidth = 0.5
            i.layer.borderColor = UIColor.lightGray.cgColor
            i.layer.cornerRadius = 10
        }
        
    }
    
    //Validation
    
    @objc func signUpValidationCheck(){
        
        if tfFullName.text == ""{
            ReUsableFunc.borderColor(tfName: tfFullName, colorName: colorCode.redBorder)
            ReUsableFunc.alertShow(title: "", message: Constants.enterFullName, controller: self)
        }else if tfEmail.text == ""{
            ReUsableFunc.borderColor(tfName: tfEmail, colorName: colorCode.redBorder)
            ReUsableFunc.alertShow(title: "", message: Constants.enterEmail, controller: self)
        }else if tfMobileNumber.text == ""{
            ReUsableFunc.borderColor(tfName: tfMobileNumber, colorName: colorCode.redBorder)
            ReUsableFunc.alertShow(title: "", message: Constants.enterMobile, controller: self)
        }else if tfDateOfBirth.text == ""{
            ReUsableFunc.borderColor(tfName: tfDateOfBirth, colorName: colorCode.redBorder)
            ReUsableFunc.alertShow(title: "", message: Constants.enterDateOfBirth, controller: self)
        }else if tfPassword.text == ""{
            ReUsableFunc.borderColor(tfName: tfPassword, colorName: colorCode.redBorder)
            ReUsableFunc.alertShow(title: "", message: Constants.enterPassword, controller: self)
        }else if tfConfirmPassword.text == ""{
            ReUsableFunc.borderColor(tfName: tfConfirmPassword, colorName: colorCode.redBorder)
            ReUsableFunc.alertShow(title: "", message: Constants.enterConfimPass, controller: self)
        }else{
            if (tfEmail.text?.isValidEmail)!{
                if (tfMobileNumber.text?.isPhoneNumber)!{
                    if (tfPassword.text?.isPasswordValid)!{
                        if tfPassword.text != tfConfirmPassword.text{
                            ReUsableFunc.borderColor(tfName: tfConfirmPassword, colorName: colorCode.redBorder)
                            ReUsableFunc.alertShow(title: "", message: Constants.passMatch, controller: self)
                        }else{
                            createUser()
                        }
                    }else{
                        ReUsableFunc.borderColor(tfName: tfPassword, colorName: colorCode.redBorder)
                        ReUsableFunc.alertShow(title: "", message: Constants.passWordCheck, controller: self)
                    }
                }else{
                    ReUsableFunc.borderColor(tfName: tfMobileNumber, colorName: colorCode.redBorder)
                    ReUsableFunc.alertShow(title: "", message: Constants.numberCheck, controller: self)
                }
            }else{
                ReUsableFunc.borderColor(tfName: tfEmail, colorName: colorCode.redBorder)
                ReUsableFunc.alertShow(title: "", message: Constants.emailCheck, controller: self)
            }
        }
    }
    
    func createUser(){
        
        let userDef = UserDefaults.standard
        
        let user = User(name: tfFullName.text!, contactNo: tfMobileNumber.text!, email: tfEmail.text!, dateOfBirth: tfDateOfBirth.text!, address: nil, passOut: "00/00" )
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            setUserDefault(key: UserDefaultKey.kUserkey, value: encoded as AnyObject)
            setUserDefault(key: tfEmail.text!, value: tfPassword.text! as AnyObject)

            let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
            nextVc.user = user
            self.navigationController?.pushViewController(nextVc, animated: true)
            
        }
    }
    
}

extension SignUpViewController :UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case tfFullName:
            tfEmail.becomeFirstResponder()
        case tfEmail:
            if (tfEmail.text?.isValidEmail)!{
                tfMobileNumber.becomeFirstResponder()
            }else{
                ReUsableFunc.borderColor(tfName: tfEmail, colorName: colorCode.redBorder)
                ReUsableFunc.alertShow(title: "", message: Constants.emailCheck, controller: self)
            }
        case tfMobileNumber:
            if (tfMobileNumber.text?.isPhoneNumber)!{
                tfPassword.becomeFirstResponder()
            }else{
                ReUsableFunc.borderColor(tfName: tfMobileNumber, colorName: colorCode.redBorder)
                ReUsableFunc.alertShow(title: "", message: Constants.numberCheck, controller: self)
            }
        case tfPassword:
            if (tfPassword.text?.isPasswordValid)!{
                tfConfirmPassword.becomeFirstResponder()
            }else{
                ReUsableFunc.borderColor(tfName: tfPassword, colorName: colorCode.redBorder)
                ReUsableFunc.alertShow(title: "", message: Constants.passWordCheck, controller: self)
            }
        default:
            if tfPassword.text != tfConfirmPassword.text{
                ReUsableFunc.borderColor(tfName: tfConfirmPassword, colorName: colorCode.redBorder)
                ReUsableFunc.alertShow(title: "", message: Constants.passMatch, controller: self)
            }else{
                tfConfirmPassword.resignFirstResponder()
            }
        }
        return true
    }
    
}

extension SignUpViewController{
    
    func tfColorNormal(){
        
        let tap = UITapGestureRecognizer(target:self, action: #selector(changeBorderColor))
        view.addGestureRecognizer(tap)
        
    }
    @objc func changeBorderColor(){
        
        for i in tfArray{
            i.layer.borderColor = UIColor(named: colorCode.grayBorder)?.cgColor
        }
        
    }
}
