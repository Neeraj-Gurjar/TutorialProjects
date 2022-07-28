//
//  ForgotPasswordViewController.swift
//  DingDorm
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var tfEmail:UITextField!
    @IBOutlet weak var btnSend:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnSend.layer.cornerRadius = 25
        btnSend.addTarget(self, action: #selector(sendPasswordRecovery), for: .touchUpInside)
    }
    
    @IBAction func btnABack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func sendPasswordRecovery(){
        if tfEmail.text != ""{
            let nextVc = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentiFier.verificationLinkVc) as! VerificationLinkViewController
            
            self.navigationController?.pushViewController(nextVc, animated: true)
           
        }
    }

}
