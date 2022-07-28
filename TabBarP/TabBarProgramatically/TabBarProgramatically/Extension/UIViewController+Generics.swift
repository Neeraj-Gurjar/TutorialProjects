//
//  ReUseFunc.swift
//  TabBarProgramatically
//
//  Created by bitcot on 17/06/22.
//

import Foundation
import UIKit


extension UIViewController{
    
    func showAlert(title:String, message:String){
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
       let noAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
       alert.addAction(noAction)
       self.present(alert, animated: true, completion: nil)
   }
}

extension NSMutableAttributedString{
    func setColor(color:UIColor, forText stringValue:String){
        let range:NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension String{
    var isPhoneNumber:Bool{
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first{
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
            }else{
                return false
            }
        }catch{
            return false
        }
    }
    var isPasswordValid:Bool{
        let passwordTest = NSPredicate(format: MessageString.match, MessageString.passwordRgx)
        return passwordTest.evaluate(with: self)
    }
    var isValidEmail:Bool{
        let emailTest = NSPredicate(format: MessageString.match, MessageString.emailRgx)
        return emailTest.evaluate(with: self)
    }
}

extension UIViewController{
    func hideKeyboardWhenTapAround(){
        let tap  = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dissmissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dissmissKeyboard(){
        view?.endEditing(true)
    }
}

//extension NSMutableAttributedString{
//    func setColor(color:UIColor, forText stringValue:String){
//        let range:NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
//        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
//    }
//}

//extension UIViewController{
//    public func setUserDefault(key: String, value: AnyObject) {
//        let userDefaults = UserDefaults.standard
//        userDefaults.setValue(value, forKey: key)
//        userDefaults.synchronize()
//    }
//
//
//    public func getUserDefault(key: String) -> AnyObject? {
//        let userDefaults = UserDefaults.standard
//        return userDefaults.value(forKey: key) as AnyObject?
//    }
//}
