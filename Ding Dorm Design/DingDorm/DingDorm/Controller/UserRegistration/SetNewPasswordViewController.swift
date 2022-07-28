//
//  SetNewPasswordViewController.swift
//  DingDorm
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class SetNewPasswordViewController: UIViewController {
    
    @IBOutlet weak var tfPassWord:UITextField!
    @IBOutlet weak var tfConfirmPassWord:UITextField!
    @IBOutlet weak var btnResetPassWord:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnResetPassWord.layer.cornerRadius = 25
        btnResetPassWord.addTarget(self, action: #selector(resetPassword), for: .touchUpInside)
    }
    
    @IBAction func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }
    
    @objc func resetPassword(){
        if tfPassWord.text != tfConfirmPassWord.text {
            
        }else{
            let nextVc = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentiFier.passResetVc) as! PasswordResetViewController
            
            self.navigationController?.pushViewController(nextVc, animated: true)
        }
    }
    
    func validation(){
        
    }

}
