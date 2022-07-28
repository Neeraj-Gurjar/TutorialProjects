//
//  ClassMateDetailViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 23/06/22.
//

import UIKit

class ClassMateDetailViewController: UIViewController {
    
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var mobileNumber: UILabel!
    @IBOutlet weak var chatBackgroundVw: UIView!
    @IBOutlet weak var callBackgroundVw: UIView!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var emailBackgroundVw: UIView!
    
    let backBtn = UIButton(type: .system)
    var user : User!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewData()
        Utility.navBarLeftButton(button: backBtn, imgName: "BackBtnArrow", btnTitle: "Back", navBar: navigationBar)
        backBtn.addTarget(self, action: #selector(btnABack), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Utility.circularView(view: chatBackgroundVw)
        Utility.circularView(view: callBackgroundVw)
        Utility.circularView(view: emailBackgroundVw)
    }
    
    func setUpViewData(){
        
        if user != nil{
            navigationBar.topItem?.title = user.name
            profileImg.image = UIImage(named: user.profileImage) 
            name.text = user.name
            address.text = user.address
            mobileNumber.text = user.contactNo
            dateOfBirth.text = user.dateOfBirth
            email.text = user.email
        }
    }
    
    @objc func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnAChat(_ sender: UIButton) {
        
    }
    
    @IBAction func btnACall(_ sender: UIButton) {
        if let url = NSURL(string: "tel://\(user.contactNo)"), UIApplication.shared.canOpenURL(url as URL) {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func btnAEmail(_ sender: UIButton) {
   
    }
}
