//
//  CustomView.swift
//  CustomViewDemo
//
//  Created by bitcot on 27/06/22.
//

import UIKit

protocol CustomViewDelegate{
    func didTapOnPass(view:CustomView)
    func didTapOnConfimr(view:CustomView)
}


class CustomView: UIView {

    @IBOutlet weak var heading: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var eyeBackgroundView:UIView!
    @IBOutlet weak var image:UIImageView!

    var iconClick = true
    var passSecureEntry = true
    var confirmPassEntry = true
    var delegate : CustomViewDelegate!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        heading.layer.masksToBounds = true
        heading.textColor = ColorCode.appThemeColor
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.cornerRadius = 10
        
    }
    
    class func loadview(frame: CGRect) -> CustomView {
        let view = Bundle.main.loadNibNamed("CustomView", owner: self)?.first as! CustomView
        view.frame = frame
        return view
    }
    
    func configureView( headingtitle: String, messagetitle: String, messagefield:Bool, eyeView:Bool = true, borderColor:CGColor, isSecuredText:Bool = false){
        heading.text = headingtitle
        message.isHidden = messagefield
        message.text = messagetitle
        textField.isSecureTextEntry = isSecuredText
        textField.layer.borderColor = borderColor
        image.image = UIImage(named: "EyeClose")
        eyeBackgroundView.isHidden = eyeView
        
    }
    
    @IBAction func btnASecurity(){
        if iconClick == true{
            image.image = UIImage(named: "EyeOpen")
            textField.isSecureTextEntry = false
        }else{
            image.image = UIImage(named: "EyeClose")
            textField.isSecureTextEntry = true
        }
        iconClick = !iconClick
        delegate?.didTapOnPass(view: self)
        delegate.didTapOnConfimr(view: self)
        
    }
}

//extension String{
//    var isPhoneNumber:Bool{
//        do {
//            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
//            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
//            if let res = matches.first{
//                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 10
//            }else{
//                return false
//            }
//        }catch{
//            return false
//        }
//    }
//    var isPasswordValid:Bool{
//        let passwordTest = NSPredicate(format: "self MATCHES%@", "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}")
//        return passwordTest.evaluate(with: self)
//    }
//    var isValidEmail:Bool{
//        let emailTest = NSPredicate(format: "self MATCHES%@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
//        return emailTest.evaluate(with: self)
//    }
//}

extension CustomView :UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
