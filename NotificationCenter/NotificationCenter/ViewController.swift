//
//  ViewController.swift
//  NotificationCenter
//
//  Created by bitcot on 07/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var title_Label:UILabel!
    
    let redKey = "notificationRed"
    let greenKey = "notificationGreen"
    let yellowKey = "notificationYellow"
    let orangeKey = "notificationOrange"
    let blackKey = "notificationBlack"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createObserver()
        
    }
    private func createObserver() {
      NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: redKey), object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: greenKey), object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: yellowKey), object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: orangeKey), object: nil)
      NotificationCenter.default.addObserver(self, selector: #selector(updateScreen(_:)), name: NSNotification.Name(rawValue: blackKey), object: nil)
    }
    deinit {
      NotificationCenter.default.removeObserver(self)
    }
    

    @objc func updateScreen(_ notification: NSNotification) {
      if let tag = notification.userInfo?["tag"] as? Int {
        title_Label.isHidden = false
        title_Label.textColor = .black
        switch tag {
        case 0:
          view.backgroundColor = .red
            title_Label.text = "You've selected red"
        case 1:
          view.backgroundColor = .green
            title_Label.text = "You've selected green"
        case 2:
          view.backgroundColor = .yellow
            title_Label.text = "You've selected yellow"
        case 3:
          view.backgroundColor = .orange
            title_Label.text = "You've selected orange"
        case 4:
          view.backgroundColor = .black
            title_Label.textColor = .white
            title_Label.text = "You've selected black"
        default:
          break
        }
      }
    }
    
    
    @IBAction func next(){
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        self.navigationController?.pushViewController(nextView, animated: true)
    }
}

