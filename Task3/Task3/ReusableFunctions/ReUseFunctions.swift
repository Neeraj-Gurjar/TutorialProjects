//
//  ReUseFunctions.swift
//  Task3
//
//  Created by bitcot on 10/06/22.
//

import Foundation
import UIKit

class ReUsableFunc {
    //Security eye
    static func securityEye(textF:UITextField, iconImage:UIImageView, iconClick:Bool){
        if iconClick == true{
            textF.isSecureTextEntry = false
            iconImage.image = UIImage(named: "password eye Open")
        } else{
            textF.isSecureTextEntry = true
            iconImage.image = UIImage(named: "password eye Close")
        }
    }
    //Alert
    static func alertShow(title:String, message:String, controller:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        controller.present(alert, animated: true, completion: nil)
    }
    
    static func borderColor(tfName:UITextField, colorName:String){
        tfName.layer.borderColor = UIColor(named: colorName)?.cgColor
    }
}
