//
//  LogInViewController.swift
//  DingDorm
//
//  Created by bitcot on 14/06/22.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var tfEmail:UITextField!
    @IBOutlet weak var tfPassword:UITextField!
    @IBOutlet weak var vwLoginBtn:UIView!
    @IBOutlet weak var lblDontHaveAnAcc:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setRegisterLabel()
        vwLoginBtn.layer.cornerRadius = 25
        
    }
    
    func setRegisterLabel(){
        
        ReUseFunc.setUpColorInLabelText(textString: "Don’t have an account? Register", colorOne: UIColor(named: "BasicHighGreen")!, colorTwo: UIColor(named: "RedColorSet")!, forTextOne: "Don’t have an account?", forTextTwo: "Register", setForLbl: lblDontHaveAnAcc)
        
    }

    @IBAction func btnForgotPassWord(){
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentiFier.forgotVc) as! ForgotPasswordViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnALogin(){
        if tfEmail.text != ""{
            if tfPassword.text != ""{
                
            }else{
                ReUseFunc.showAlert(tiitle: "", message: "Enter Password", controller: self)
            }
        }else{
            ReUseFunc.showAlert(tiitle: "", message: "Enter Email Address", controller: self)
        }
    }
    
    @IBAction func btnARegister(){
        ReUseFunc.showAlert(tiitle: "Alert", message: "Coming Soon", controller: self)
    }
    
}
