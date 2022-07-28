////
////  SignInViewController.swift
////  Task3
////
////  Created by bitcot on 24/06/22.
////
//
import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInBackgroundVw: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var imgPassEye:UIImageView!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var dontHaveAnAcc: UILabel!
    
    var iconClickPass  = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.setUpColorInLabelText(textString: "Don't have an account Register!", colorOne: UIColor.systemGray, colorTwo: ColorCode.appThemeColor!, forTextOne: "Don't have an account", forTextTwo: "Register!", setForLbl: dontHaveAnAcc)
        btnSignIn.addTarget(self, action: #selector(userSignIn), for: .touchUpInside)
        self.hideKeyboardWhenTapAround()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signInBackgroundVw.layer.borderWidth = 0.5
        signInBackgroundVw.layer.cornerRadius = 10
        signInBackgroundVw.layer.borderColor = UIColor.lightGray.cgColor
        btnSignIn.layer.cornerRadius = 20
    }
    
    @objc func userSignIn(){
        
        if tfEmail.text != "" && tfPassword.text != ""{
            
            if (tfEmail.text?.isValidEmail)!{
                signInUser()
            }else{
                showAlert(title: "", message: MessageString.emailCheck)
            }
           
        }else if tfEmail.text == ""{
            showAlert(title: "", message: MessageString.enterEmail)
        }else if tfPassword.text == ""{
            showAlert(title: "", message: MessageString.enterPassword)
        }
        
    }
    
    func signInUser(){
        
        if let user = getUserDefault(key: UserDefaultKey.kUserkey), let password = getUserDefault(key: tfEmail.text!){
            if password as! String == tfPassword.text!{
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from: user as! Data) {
                    UserSession.sharedInstance.user = user
                    let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "ClassmatesViewController") as! ClassmatesViewController
                    //    nextVc.user = user
                    self.navigationController?.pushViewController(nextVc, animated: true)
                    
                }
            }else{
                showAlert(title: "", message: MessageString.emailPassNotMatch)
            }
        }else{
            showAlert(title: "", message: MessageString.emailRegister)
        }
    }
    
    @IBAction func btnAPasswordEye(_ sender: UIButton) {
        
        Utility.securityEye(textF: tfPassword, iconImage: imgPassEye, iconClick: iconClickPass)
        iconClickPass = !iconClickPass
    }
    
    @IBAction func btnASignUp(_ sender: UIButton){
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
}
