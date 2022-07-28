//
//  PasswordResetViewController.swift
//  DingDorm
//
//  Created by bitcot on 15/06/22.
//

import UIKit

class PasswordResetViewController: UIViewController {
    
    @IBOutlet weak var vwContinue:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        vwContinue.layer.cornerRadius = 25
        
    }
    
    @IBAction func btnAcontinue(){
        
    }
    
    @IBAction func btnAbackToLogin(){
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentiFier.loginVC) as! LogInViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
   
    }

}
