//
//  ReUseFunc.swift
//  DingDorm
//
//  Created by bitcot on 15/06/22.
//

import Foundation
import UIKit

struct ReUseFunc{
    
    static func setUpColorInLabelText(textString:String, colorOne:UIColor, colorTwo:UIColor, forTextOne:String, forTextTwo:String,  setForLbl:UILabel){
        
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string: textString)
        attributedString.setColor(color: colorOne, forText: forTextOne)
        attributedString.setColor(color: colorTwo, forText: forTextTwo)
        setForLbl.attributedText = attributedString
   
    }
    
    static func showAlert(tiitle:String, message:String, controller:UIViewController){
        
        let alert = UIAlertController(title: tiitle, message: message, preferredStyle: .alert)
        let actionOk =  UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(actionOk)
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func showToast(message:String, view:UIView, seconds:Double, controller:UIViewController){
               
        let lblToast = UILabel(frame: CGRect(x: 0.0, y: view.frame.height/2, width: view.frame.width, height: 35))
            lblToast.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            lblToast.textColor = UIColor.white
        lblToast.font = UIFont(name: "Arial", size: 12.0)
            lblToast.textAlignment = .center;
            lblToast.text = message
            lblToast.alpha = 1.0
            lblToast.layer.cornerRadius = 10;
            lblToast.clipsToBounds  =  true
            DispatchQueue.main.async {
                view.addSubview(lblToast)
                UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
                    lblToast.alpha = 0.0
                }, completion: {(isCompleted) in
                    lblToast.removeFromSuperview()
                })
            }
    }
    
}
