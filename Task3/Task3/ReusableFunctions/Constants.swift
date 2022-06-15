//
//  Constants.swift
//  Task3
//
//  Created by bitcot on 10/06/22.
//

import Foundation

struct Constants{
    static let enterFullName = "Please enter full name"
    static let enterEmail = "Please enter email"
    static let enterMobile = "Please enter mobile no."
    static let enterDateOfBirth = "Please enter date of birth"
    static let enterPassword = "Please enter password"
    static let enterConfimPass = "Please enter confirm password"
    static let passMatch = "Password's not matched"
    static let signUp = "SignUp Successful"
    static let emailCheck = "Enter valid Email"
    static let numberCheck = "Phone number should be in formatted properly"
    static let passWordCheck = "Password needs to have min of 8 chars, 1 Cap, 1 special char, 1 number"
    static let pleaseFillAll = "Please fill all fields first"
}


struct RgxCheck{
    static let match = "self MATCHES%@"
    static let passwordRgx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    static let emailRgx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
}

struct NavigationIdentifier{
    static let dateOfBirthViewController = "DateOfBirthViewController" 
}

struct colorCode{
    static let redBorder = "borderRed"
    static let grayBorder = "borderGray"
}
