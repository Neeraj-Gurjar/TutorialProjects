//
//  MemoryDetailViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 23/06/22.
//

import UIKit

class MemoryDetailViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var userImgBackgroundView: UIView!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var memoryTitle: UILabel!
    @IBOutlet weak var memoryDescription: UILabel!
    @IBOutlet weak var userEmailAdd: UILabel!
    @IBOutlet weak var messageBtnBackgroundVw: UIView!
    @IBOutlet weak var userPassOutDate: UILabel!
    
    let backBtn = UIButton(type: .system)
    var memory : Memory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewData()
        Utility.navBarLeftButton(button: backBtn, imgName: "BackBtnArrow", btnTitle: "Back", navBar: navigationBar)
        backBtn.addTarget(self, action: #selector(btnABack), for: .touchUpInside)
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        Utility.circularView(view: userImgBackgroundView)
        Utility.circularView(view: messageBtnBackgroundVw)
    }
    
    func setUpViewData(){
        
        if memory != nil{
            let data = memory
            let userData = memory.owner
            navigationBar.topItem?.title = data?.title
            userImg.image = UIImage(named: userData.profileImage) 
            userName.text = userData.name
            userEmail.text = userData.email
            memoryTitle.text = data?.title
            memoryDescription.text = data?.detail
            userEmailAdd.text = userData.email
            userPassOutDate.text = userData.passOut
            
        }
    }
    
    @objc func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnAGoToUserProfile(_ sender: UIButton) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "ClassMateDetailViewController") as! ClassMateDetailViewController
        nextVc.user = memory.owner
        
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    @IBAction func btnAEmailUser(_ sender: UIButton) {
        
    }
    
}
