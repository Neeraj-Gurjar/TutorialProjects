//
//  SignInViewController.swift
//  Task3
//
//  Created by bitcot on 24/06/22.
//

import UIKit


class SignInViewController: UIViewController {
    
    @IBOutlet weak var signInBackgroundVw: UIView!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    @IBOutlet weak var dontHaveAnAcc: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ReUsableFunc.setUpColorInLabelText(textString: "Don't have an account SignUp!", colorOne: UIColor.systemGray, colorTwo: UIColor(named: colorCode.themeColor)!, forTextOne: "Don't have an account", forTextTwo: "SignUp!", setForLbl: dontHaveAnAcc)
        btnSignIn.addTarget(self, action: #selector(userSignIn), for: .touchUpInside)
       
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        signInBackgroundVw.layer.borderWidth = 0.5
        signInBackgroundVw.layer.cornerRadius = 10
        signInBackgroundVw.layer.borderColor = UIColor.lightGray.cgColor
        btnSignIn.layer.cornerRadius = 20
    }
    
    @objc func userSignIn(){
        
        if let user = getUserDefault(key: UserDefaultKey.kUserkey), let password = getUserDefault(key: tfEmail.text!){
            if password as! String == tfPassword.text!{
                let decoder = JSONDecoder()
                if let user = try? decoder.decode(User.self, from: user as! Data) {
                    let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    nextVc.user = user
                    self.navigationController?.pushViewController(nextVc, animated: true)
                   
                }
            }else{
                ReUsableFunc.alertShow(title: "", message: "password do not match", controller: self)
              
            }
           
        }
      
           
        
        
    }
    
    @IBAction func btnASignUp(_ sender: UIButton){
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
       
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }

}
