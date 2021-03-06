//
//  Extensions.swift
//  Task3
//
//  Created by bitcot on 13/06/22.
//

import Foundation
import UIKit

//SingUpViewController MobileNumber, Password, EmailAddress Validation Extension
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
        let passwordTest = NSPredicate(format: RgxCheck.match, RgxCheck.passwordRgx)
        return passwordTest.evaluate(with: self)
    }
    var isValidEmail:Bool{
        let emailTest = NSPredicate(format: RgxCheck.match, RgxCheck.emailRgx)
        return emailTest.evaluate(with: self)
    }
}

extension NSMutableAttributedString{
    func setColor(color:UIColor, forText stringValue:String){
        let range:NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}

extension UIViewController{
    public func setUserDefault(key: String, value: AnyObject) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(value, forKey: key)
        userDefaults.synchronize()
    }
    

    public func getUserDefault(key: String) -> AnyObject? {
        let userDefaults = UserDefaults.standard
        return userDefaults.value(forKey: key) as AnyObject?
    }
}
