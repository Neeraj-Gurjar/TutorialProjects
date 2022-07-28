//
//  Extensions.swift
//  DingDorm
//
//  Created by bitcot on 14/06/22.
//

import Foundation
import UIKit

extension NSMutableAttributedString{
    func setColor(color:UIColor, forText stringValue:String){
        let range:NSRange = self.mutableString.range(of: stringValue, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}


