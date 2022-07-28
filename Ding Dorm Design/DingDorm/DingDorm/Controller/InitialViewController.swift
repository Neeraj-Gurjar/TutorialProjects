//
//  InitialViewController.swift
//  DingDorm
//
//  Created by bitcot on 14/06/22.
//

import UIKit

class InitialViewController: UIViewController {
    
    @IBOutlet weak var lblDingDorm:UILabel!
    @IBOutlet weak var vwLoginBtn:UIView!
    @IBOutlet weak var vwSignUpBtn:UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpDingDormLabel()
        vwLoginBtn.layer.cornerRadius = 22
        vwSignUpBtn.layer.cornerRadius = 22
        
   }
    
    func setUpDingDormLabel(){
        
        ReUseFunc.setUpColorInLabelText(textString: "Ding Dorm", colorOne: UIColor(named: "BasicHighGreen")!, colorTwo: UIColor(named: "BasicLightYellow")!, forTextOne: "Ding", forTextTwo: "Dorm", setForLbl: lblDingDorm)
        
    }
    
    @IBAction func goToLogInView(){
        
        let nextVc =  self.storyboard?.instantiateViewController(withIdentifier: ViewControllerIdentiFier.loginVC) as! LogInViewController
        
        self.navigationController?.pushViewController(nextVc, animated: true)
    
    }
    
    @IBAction func goToRegister(){
        
        ReUseFunc.showAlert(tiitle: "Alert", message: "Coming Soon", controller: self)
        
    }
    
}
