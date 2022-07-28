//
//  SideMenuViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 17/06/22.
//

import UIKit

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var vwImageView:UIView!
    @IBOutlet weak var profileImg:UIImageView!
    @IBOutlet weak var email:UILabel!
    @IBOutlet weak var tblVwSideMenu:UITableView!
    @IBOutlet weak var bottomTitle: UILabel!
    
    var user : User!
    var menuOptions = [SideBarMenu]()
    var bottomtitleString = "bitcot"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuOptions = SideMenuConstants.sideBar
        tblVwSetup()
        if #available(iOS 15.0, *) {
            Utility.setUpColorInLabelText(textString: bottomtitleString, colorOne: UIColor.white, colorTwo: UIColor.systemCyan, forTextOne: "bit", forTextTwo: "cot", setForLbl: bottomTitle)
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        vwImageView.layer.masksToBounds = true
        vwImageView.layer.cornerRadius = vwImageView.frame.height/2
    }
    
    func tblVwSetup(){
        tblVwSideMenu.dataSource = self
        tblVwSideMenu.delegate = self
        let uiNib = UINib(nibName: "SideMenuTableViewCell", bundle: nil)
        tblVwSideMenu.register(uiNib, forCellReuseIdentifier: SideMenuTableViewCell.identifier)
    }
    
    func setVwdata(){
        
        email.text = user.email
    }

}

extension SideMenuViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblVwSideMenu.dequeueReusableCell(withIdentifier: SideMenuTableViewCell.identifier, for: indexPath) as! SideMenuTableViewCell
        if menuOptions != nil{
            let menu = menuOptions[indexPath.row]
            cell.configureCell(menuOptions: menu)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedMenu = indexPath.row
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        
        if selectedMenu == 0{
            nextVc.webURL = SiteURL.bitCotURL
            self.present(nextVc, animated: true, completion: nil)
        }else if selectedMenu == 1{
            nextVc.webURL = SiteURL.privacyURL
            self.present(nextVc, animated: true, completion: nil)
        }else if selectedMenu == 2{
            nextVc.webURL = SiteURL.aboutURL
            self.present(nextVc, animated: true, completion: nil)
        }else{
               let alert = UIAlertController(title: "Alert", message: "Do you want to sign out", preferredStyle: .alert)
               let noAction = UIAlertAction(title: "No", style: .default, handler: nil)
               alert.addAction(noAction)
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { UIAlertAction in
                let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
    
                self.navigationController?.pushViewController(nextVc, animated: true)
            }
               alert.addAction(yesAction)
               self.present(alert, animated: true, completion: nil)
        }
    }
}
