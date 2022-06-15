//
//  ViewController.swift
//  ViewAnimation
//
//  Created by bitcot on 07/06/22.
//

import UIKit

class ViewController: UIViewController {
    let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    var myLabel = UILabel()
   
    var abc = "Inspire"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .yellow
        myView.center = view.center
        view.addSubview(myView)
        
        
        myLabel.text = abc
        myLabel.frame = CGRect(x: (view.frame.size.width-200)/2, y: 50, width: 200, height: 40)
        myLabel.textAlignment = .center
        view.addSubview(myLabel)
        
        let myButton = UIButton(frame: CGRect(x: (view.frame.size.width-200)/2  , y: (view.frame.size.height-220), width: 200, height: 50))
        myButton.backgroundColor = .black
        myButton.layer.cornerRadius = 20
        myButton.setTitleColor(UIColor.white, for: .normal)
        myButton.setTitle("Click", for: .normal)
        myButton.addTarget(self, action: #selector(doAnimation), for: .touchUpInside)
        view.addSubview(myButton)
        
    }
    
    @objc func doAnimation(){
        UIView.animate(withDuration: 1, animations: {
           // self.myView.alpha = 0.0
            self.myView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
            self.myView.center = self.view.center
            self.myLabel.alpha = 0.0
            
        }, completion: { done in
            if done{
                self.shrink()
            }
        })
    }

    func shrink(){
        UIView.animate(withDuration: 1, animations: {
            self.myView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            self.myView.center = self.view.center
            self.myLabel.alpha = 1
        }, completion: { done in
            if done
            {
                self.animeforatext()
            }
        })
    }
    
    func animeforatext(){
        UIView.animate(withDuration: 1, animations: {
            self.myLabel.textColor = .blue
            self.myLabel.backgroundColor = .white
        }, completion: {done in
            if done{
                self.doAnimation()
            }
        })
    }
}


