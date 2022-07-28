//
//  Models.swift
//  TabBarProgramatically
//
//  Created by bitcot on 16/06/22.
//

import Foundation
import UIKit

struct User:Codable{
    var name : String
    var contactNo : String
    var email : String
    var profileImage : String
    var dateOfBirth : String
    var address : String
    var passOut : String
    
    init(name:String, contactNo:String, email:String, profileImage:String, dateOfBirth:String, address:String, passOut:String){
        self.name = name
        self.contactNo = contactNo
        self.email = email
        self.profileImage = profileImage
        self.dateOfBirth = dateOfBirth
        self.address = address
        self.passOut = passOut
    }
}

struct SideBarMenu{
    var icon:UIImage
    var title:String
    
    init(icon:UIImage, title:String){
        self.icon = icon
        self.title = title
    }
}

struct Event{
    var image:UIImage
    var title: String
    var detail: String
    var date : String
    
    init(image:UIImage, title:String, detail:String, date:String){
        self.image = image
        self.title = title
        self.detail = detail
        self.date = date
    }
}

struct Memory{
    var title:String
    var detail:String
    var date:String
    var owner:User
    
    init(title:String, detail:String, date:String, owner:User){
        self.title = title
        self.detail = detail
        self.date = date
        self.owner = owner
    }
}

struct Gallery{
    var storyImage:UIImage
    var title:String
    
    init(storyImage:UIImage, title:String){
        self.storyImage = storyImage
        self.title = title
    }
}
