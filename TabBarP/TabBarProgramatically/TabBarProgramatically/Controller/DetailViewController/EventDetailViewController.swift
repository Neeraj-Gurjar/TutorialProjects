//
//  EventDetailViewController.swift
//  TabBarProgramatically
//
//  Created by bitcot on 23/06/22.
//

import UIKit

class EventDetailViewController: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var fbBackgroundVw: UIView!
    @IBOutlet weak var twitterBackgroundVw: UIView!
    @IBOutlet weak var instagramBackgroundVw: UIView!
    
    let backBtn = UIButton(type: .system)
    var event : Event!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewData()
        Utility.navBarLeftButton(button: backBtn, imgName: "BackBtnArrow", btnTitle: "Back", navBar: navigationBar)
        backBtn.addTarget(self, action: #selector(btnABack), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        Utility.circularView(view: fbBackgroundVw)
        Utility.circularView(view: twitterBackgroundVw)
        Utility.circularView(view: instagramBackgroundVw)
    }
    
    func setUpViewData(){
        
        if event != nil{
            let data = event
            navigationBar.topItem?.title = data?.title
            eventImage.image = data?.image
            eventTitle.text = data?.title
            eventDescription.text = data?.detail
            eventDate.text = data?.date
            
        }
    }
    
    @objc func btnABack(){
        self.navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnAFB(_ sender: UIButton) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        nextVc.webURL = SiteURL.fbURL
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    @IBAction func btnATwitter(_ sender: UIButton) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        nextVc.webURL = SiteURL.twitterURL
        self.navigationController?.pushViewController(nextVc, animated: true)
        
    }
    
    @IBAction func btnAInstagram(_ sender: UIButton) {
        
        let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "WebViewController") as! WebViewController
        nextVc.webURL = SiteURL.instagramURL
        self.navigationController?.pushViewController(nextVc, animated: true)
    }
    
    
}
