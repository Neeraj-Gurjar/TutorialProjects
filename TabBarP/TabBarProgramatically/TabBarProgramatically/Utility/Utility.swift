//
//  Utility.swift
//  TabBarProgramatically
//
//  Created by bitcot on 23/06/22.
//

import Foundation
import UIKit

struct Utility{
    
    static func navBarLeftButton(button:UIButton, imgName:String, btnTitle:String, navBar:UINavigationBar){
        
        button.setImage(UIImage(named: imgName), for: .normal)
        button.setTitle(btnTitle, for: .normal)
        button.sizeToFit()
        navBar.topItem?.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    static func circularView(view:UIView){
        view.layer.masksToBounds = true
        view.layer.cornerRadius = view.frame.height/2
    }
    
    static func setUpColorInLabelText(textString:String, colorOne:UIColor, colorTwo:UIColor, forTextOne:String, forTextTwo:String,  setForLbl:UILabel){
        
        let attributedString:NSMutableAttributedString = NSMutableAttributedString(string: textString)
        attributedString.setColor(color: colorOne, forText: forTextOne)
        attributedString.setColor(color: colorTwo, forText: forTextTwo)
        setForLbl.attributedText = attributedString
   
    }
    
    static func securityEye(textF:UITextField, iconImage:UIImageView, iconClick:Bool){
        if iconClick == true{
            textF.isSecureTextEntry = false
            iconImage.image = UIImage(named: "EyeOpen")
        } else{
            textF.isSecureTextEntry = true
            iconImage.image = UIImage(named: "EyeClose")
        }
    }
    
    static func borderColor(tfName:UITextField, colorName:UIColor){
        tfName.layer.borderColor = colorName.cgColor
        tfName.layer.borderWidth = 2
        tfName.textColor = colorName
        
    }
}
