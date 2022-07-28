//
//  HomeViewController.swift
//  Task3
//
//  Created by bitcot on 24/06/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var detail: UILabel!
    
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()

        detail.text = "You are logged in Name-\((user?.name)!), Contact no.-\((user?.contactNo)!), Email-\((user?.email)!), Date of birth-\((user?.dateOfBirth)!)"
    }
    
    @IBAction func btnALogout(_ sender: UIButton) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    
}
