//
//  VerificationLinkViewController.swift
//  DingDorm
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class VerificationLinkViewController: UIViewController {
    
    @IBOutlet weak var vwResend:UIView!
    @IBOutlet weak var btnResend:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vwResend.layer.cornerRadius = 25
    
    }
    
    @IBAction func btnABack(){
        
        self.navigationController?.popViewController(animated: false)
        
    }
    
    @IBAction func btnABackToLogin(){
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentiFier.setNewPassVc) as! SetNewPasswordViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    @IBAction func btnAReSendEmailLink(){
        
        ReUseFunc.showAlert(tiitle: "", message: "Reset link has been sent to the registered email", controller: self)
        
    }

}
