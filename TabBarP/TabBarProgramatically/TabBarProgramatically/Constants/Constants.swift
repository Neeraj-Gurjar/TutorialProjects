//
//  Constants.swift
//  TabBarProgramatically
//
//  Created by bitcot on 16/06/22.
//

import Foundation
import UIKit

struct Constants{
    
    static let users = [User(name: "William", contactNo: "1000000000", email: "William@Email.com", profileImage: "AvatarMen", dateOfBirth: "01/01/93", address: "Near road 1",  passOut: "00/01"),
                        User(name: "Mike", contactNo: "2000000000", email: "Mike@Email.com", profileImage: "AvatarMen", dateOfBirth: "02/02/92", address: "Near road 2", passOut: "00/02"),
                        User(name: "Morbius", contactNo: "3000000000", email: "Morbius@Email.com", profileImage: "AvatarMen", dateOfBirth: "02/02/94", address: "Near road 3", passOut: "00/03"),
                        User(name: "Alane", contactNo: "4000000000", email: "Alane@Email.com", profileImage: "AvatarMen", dateOfBirth: "03/03/95", address: "Near road 4", passOut: "00/04"),
                        User(name: "Nike", contactNo: "5000000000", email: "Nike@Email.com", profileImage: "AvatarMen", dateOfBirth: "04/04/94", address: "new road 5", passOut: "00/05"),
                        User(name: "Odin", contactNo: "6000000000", email: "Odin@Email.com", profileImage: "AvatarMen", dateOfBirth: "05/05/90", address: "new road 6", passOut: "00/06"),
                        User(name: "Jhon", contactNo: "7000000000", email: "Jhon@Email.com", profileImage: "AvatarMen", dateOfBirth: "06/06/90", address: "new road 7", passOut: "00/07"),
                        User(name: "Margi", contactNo: "8000000000", email: "Margi@Email.com", profileImage: "AvatarWomen", dateOfBirth: "07/07/91", address: "new road 8", passOut: "00/08"),
                        User(name: "Scarlet", contactNo: "9000000000", email: "Scarlet@Email.com", profileImage: "AvatarWomen", dateOfBirth: "08/08/92", address: "new road 9", passOut: "00/09"),
                        User(name: "Kylei", contactNo: "10000200000", email: "Kylei@Email.com", profileImage: "AvatarWomen", dateOfBirth: "09/09/93", address: "new road 10", passOut: "00/10"),
                        User(name: "Paul", contactNo: "1100000000", email: "Paul@Email.com", profileImage: "AvatarMen", dateOfBirth: "10/10/93", address: "new road 11", passOut: "00/11"),
                        User(name: "Victory", contactNo: "1200000000", email: "Victory@Email.com", profileImage: "AvatarWomen", dateOfBirth: "11/11/94", address: "new road 12", passOut: "00/12"),
                        User(name: "Elizabeth", contactNo: "1300000000", email: "Elizabeth@Email.com", profileImage: "AvatarWomen", dateOfBirth: "12/12/90", address: "new road 13", passOut: "00/13"),
                        User(name: "Paper", contactNo: "1400000000", email: "Paper@Email.com", profileImage: "AvatarWomen", dateOfBirth: "12/12/94", address: "new road 14", passOut: "00/14"),
                        User(name: "Nik", contactNo: "1500000000", email: "Nik@Email.com", profileImage: "AvatarMen", dateOfBirth: "13/01/93", address: "new road 15", passOut: "00/15"),
                        User(name: "Bhotom", contactNo: "1600000000", email: "Bhotom@Email.com", profileImage: "AvatarMen", dateOfBirth: "14/01/94", address: "new road 16", passOut: "00/16"),
                        User(name: "Dr. Beth", contactNo: "1700000000", email: "Dr. Beth@Email.com", profileImage: "AvatarWomen", dateOfBirth: "15/02/94", address: "new road 17", passOut: "00/17"),
                        User(name: "Vin Diesel", contactNo: "1800000000", email: "Vin Diesel@Email.com", profileImage: "AvatarMen", dateOfBirth: "16/05/93", address: "new road 18", passOut: "00/18"),
                        User(name: "Brian", contactNo: "1900000000", email: "Brian@Email.com", profileImage: "AvatarMen", dateOfBirth: "17/02/91", address: "new road 19", passOut: "00/19"),
                        User(name: "Jorge", contactNo: "2000000000", email: "Jorge@Email.com", profileImage: "AvatarMen", dateOfBirth: "08/08/92", address: "new road 20", passOut: "00/20"),
                        User(name: "Reffary", contactNo: "2100000000", email: "Reffary@Email.com", profileImage: "AvatarMen", dateOfBirth: "28/02/92", address: "new road 21", passOut: "00/21"),
                        User(name: "Ember", contactNo: "2200000000", email: "Embere@Email.com", profileImage: "AvatarWomen", dateOfBirth: "08/12/90", address: "new road 22", passOut: "00/22"),
                        User(name: "Olivia", contactNo: "2300000000", email: "Olivia@Email.com", profileImage: "AvatarWomen", dateOfBirth: "25/03/95", address: "new road 23", passOut: "00/23"),
                        User(name: "Emma", contactNo: "2400000000", email: "Emma@Email.com", profileImage: "AvatarWomen", dateOfBirth: "14/08/90", address: "new road 24", passOut: "00/24"),
                        User(name: "Mia", contactNo: "2500000000", email: "Mia@Email.com", profileImage: "AvatarWomen", dateOfBirth: "15/12/93", address: "new road 25", passOut: "00/25"),
                        User(name: "Isabella", contactNo: "2600000000", email: "Isabella@Email.com", profileImage: "AvatarWomen", dateOfBirth: "20/01/94", address: "new road 26", passOut: "00/26"),
                        User(name: "Amelia", contactNo: "2700000000", email: "Amelia@Email.com", profileImage: "AvatarWomen", dateOfBirth: "08/10/92", address: "new road 27", passOut: "00/27"),
                        User(name: "Charlotte", contactNo: "2800000000", email: "Charlotte@Email.com", profileImage: "AvatarWomen", dateOfBirth: "31/08/92", address: "new road 28", passOut: "00/28"),
                        User(name: "Michael", contactNo: "2900000000", email: "Michael@Email.com", profileImage: "AvatarMen", dateOfBirth: "01/09/90", address: "new road 29", passOut: "00/29"),
                        User(name: "Robert", contactNo: "3000000000", email: "Robert@Email.com", profileImage: "AvatarMen", dateOfBirth: "22/12/90", address: "new road 30", passOut: "00/30"),
                        User(name: "Ethan", contactNo: "3100000000", email: "Ethan@Email.com", profileImage: "AvatarWomen", dateOfBirth: "19/02/94", address: "new road 31", passOut: "00/31"),
                        User(name: "Daniel", contactNo: "3200000000", email: "Daniel@Email.com", profileImage: "AvatarMen", dateOfBirth: "18/04/92", address: "new road 32", passOut: "00/32"),
                        User(name: "Noah", contactNo: "3300000000", email: "Noah@Email.com", profileImage: "AvatarMen", dateOfBirth: "05/08/91", address: "new road 33", passOut: "00/33"),
                        User(name: "Anthony", contactNo: "3400000000", email: "Anthony@Email.com", profileImage: "AvatarMen", dateOfBirth: "08/08/93", address: "new road 34", passOut: "00/34"),
                        User(name: "Mason", contactNo: "3500000000", email: "Mason@Email.com", profileImage: "AvatarMen", dateOfBirth: "12/12/92", address: "new road 35", passOut: "00/35") ]
    
    static let events = [Event(image: UIImage(named: "NewApplicationForms")!, title: "New Admission form available", detail: "New Admission form available,New Admission form available,New Admission form available,New Admission form available", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "NewBatchStarts")!, title: "Bathces Start", detail: "Join as early before full", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "NewBioLabOpening")!, title: "New BioLab", detail: "Boi,Bio,bio,bio,New BioLab,New BioLab,New BioLab,New BioLab,New BioLab,New BioLab,New BioLab,New BioLab,New BioLab,New BioLab", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "NextMonthVisit")!, title: "Visiting Tour", detail: "Limited seats please register your self as earliest as possible", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "LibraryOpenForAll")!, title: "New Library", detail: "New collection with very new books go visit onces", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "Ceremony")!, title: "Ceremony", detail: "Ceremony,Ceremony,Ceremony,Ceremony,Ceremony", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "ARWorldComingSoon")!, title: "AR World ComingSoon", detail: "Future reality", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "AnnualGeneralMeeting")!, title: "Annual General Meeting", detail: "All needs to be present", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "NextWeekGuestLecture")!, title: "Next Week Guest Lecture", detail: "Next Week Guest Lecture, NextWeekGuestLecture, NextWeekGuestLecture, Next Week Guest Lecture, Next Week Guest Lecture, Next Week Guest Lecture,Next Week Guest Lecture,Next Week Guest Lecture,Next Week Guest Lecture", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "Quarterly800MeterRace")!, title: "Quarterly 800 Meter Race", detail: "Join the race and jump to the fitness world", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "Quiz2022")!, title: "Quiz 2022", detail: "Quiz 2022,Quiz 2022,Quiz 2022,Quiz 2022,Quiz 2022", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "TeachersDayCelebration")!, title: "Teachers Day Celebration", detail: "Teachers Day Celebration join the assembly area", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "UpcomingSingingEvent")!, title: "Upcoming Singing Event", detail: "Time for shine", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "WeeklySeminar")!, title: "Weekly Seminar", detail: "Weekly Seminar,Weekly Seminar,Weekly Seminar,Weekly Seminar", date: "Thursday, September 17, 2020 at 12:00:00 AM"),
                         Event(image: UIImage(named: "YearlyAnnualMeeting")!, title: "Yearly Annual Meeting", detail: "Yearly Annual Meeting,Yearly Annual Meeting,Yearly Annual Meeting", date: "Thursday, September 17, 2020 at 12:00:00 AM") ]
    
    static let memories = [Memory(title: "Bonfire Night", detail: "I loved bonfire night ever bit as much as Christmas, perhaps more. It was a wild night in all the best ways. It was fun and freedom, excitement and adventure. My Dad would have spent the year throwing sticks and wood onto a pile in the back garden. Come the 5th of November it was veritable mountain in the eyes of us children. He'd set it ablaze with a homemade guy on top. It lit up the night, warming hands and faces. Upon it we'd throw potatoes wrapped in tin foil to eat later with baked beans. I never went camping, or had a camp fire, but I reckon that bonfire topped them all. Then there were the fireworks, our very own display! We weren't rich by any stretch of the imagination, but I guess you find the money for things you really care about. Dad loved bonfire night. He was the biggest kid of us all.", date: "jan/2021", owner: users[3]),
                           Memory(title: "Cupcake", detail: "The cupcakes were normal I guess. If you watch those cooking shows you'd think it took an hour of sweat and five saucepans to make one. Not so. Most cupcakes are a regular cake recipe such as Victoria sponge and then a regular buttercream or ganache on top. Maybe add some sprinkles if you're feeling fancy. When we cook that way we can all enjoy them as the sweet childhood treat they were always meant to be.", date: "Feb/2021", owner: users[20]),
                           Memory(title: "Birthday Cake", detail: "The birthday cake was rainbows on rainbows. It was layered rainbow hued cakes in rainbow hued buttercream and rainbow sprinkles on top. What can I say? Mom believed in putting a hat on a hat.", date: "June/2021", owner: users[30]),
                           Memory(title: "Homemade Cake", detail: "It was a classic Victoria sponge with buttercream and jam. To me, that's a homemade cake and about as much fancy as any cake requires. It tasted great and had the aroma of home.", date: "july/2021", owner: users[23]),
                           Memory(title: "Night", detail: "As shield of Earth the night is given upon celestial clock.", date: "Aug/2021", owner: users[7]),
                           Memory(title: "Fireworks Night", detail: "I always saw daises as the stars of earth, as if they were born to bring sparks of white to the green. And so upon fireworks night those blooms of brilliant light were the Earth's ode to the stars, our gift of flowers.", date: "Dec/2021", owner: users[11]),
                           Memory(title: "New Years Eve", detail: "This New Year's Eve, in this constellation crowd, you are my north star.", date: "Jan/2022", owner: users[21]),
                           Memory(title: "Firework", detail: "That black powder packed the the kind of punch that lit up the night and warmed the heart.", date: "Feb/2022", owner: users[29]),
                           Memory(title: "Lunar New Year", detail: "Upon this Lunar New Year, amid the wintry air, beneath the noble starry-black, we observe the beauty of the moon. She graces Earth's sky to glow equally for all, a picture in light as if created by love.", date: "March/2022", owner: users[16]),
                           Memory(title: "Lamps", detail: "Lamps into the soft spun dawn, Sweet glow in echo to rising sun, Poetry of eye and soul, Bring sweet reflective mood, Ambience of good things to come.", date: "April/2022", owner: users[9]),
                           Memory(title: "Moonbeams", detail: "Moonbeams kissed the blacktop road into deepest grey.", date: "May/2022", owner: users[17]),
                           Memory(title: "Stars", detail: "The stars of heaven bloomed in the velvet black.", date: "June/2022", owner: users[26]),
                           Memory(title: "Sunset", detail: "Sunset came to the highlands as God's poetry, hues from flame to heather told in soft rolling verse.", date: "july/2022", owner: users[33]),
                           Memory(title: "Sun Rays", detail: "Sun rays come as if creating new tunnels where none realised mountains exist.", date: "Aug/2022", owner: users[4]),
                           Memory(title: "Winter Sunset", detail: "In those long winter days, when our souls called for the blooms of summer meadows, the sunset blossomed in the sky and shone her colours onto the land.", date: "Sep/2022", owner: users[1]) ]
    
    static let galleries = [Gallery(storyImage: UIImage(named: "Possibilities")!, title: "Possibilities"),
                            Gallery(storyImage: UIImage(named: "Time Flow")!, title: "Time Flow"),
                            Gallery(storyImage: UIImage(named: "Nightes")!, title: "Nightes"),
                            Gallery(storyImage: UIImage(named: "Peace")!, title: "Peace"),
                            Gallery(storyImage: UIImage(named: "Finally Found One")!, title: "Finally Found One"),
                            Gallery(storyImage: UIImage(named: "Stuck in endless loop")!, title: "Stuck in endless loop"),
                            Gallery(storyImage: UIImage(named: "Finally Creativity")!, title: "Finally Creativity"),
                            Gallery(storyImage: UIImage(named: "Ready")!, title: "Ready"),
                            Gallery(storyImage: UIImage(named: "Old Times")!, title: "Old Times"),
                            Gallery(storyImage: UIImage(named: "Something New")!, title: "Something New"),
                            Gallery(storyImage: UIImage(named: "Seen")!, title: "What a view"),
                            Gallery(storyImage: UIImage(named: "Amazing Craft")!, title: "Amazing Craft"),
                            Gallery(storyImage: UIImage(named: "Reached")!, title: "Reached") ]
}

struct SideMenuConstants{
    static let sideBar = [SideBarMenu(icon: UIImage(named: "DesktopIcon")!, title: "Bit-Cot App Development Company"), SideBarMenu(icon: UIImage(named: "PrivacyIcon")!, title: "Privacy"), SideBarMenu(icon: UIImage(named: "AboutIcon")!, title: "About"), SideBarMenu(icon: UIImage(named: "SignOutIcon")!, title: "Sign Out")]
}

struct SiteURL{
    
    static let bitCotURL:URL = URL(string: "https://www.bitcot.com/")!
    static let privacyURL:URL = URL(string: "https://www.bitcot.com/privacy/")!
    static let aboutURL:URL = URL(string: "https://www.bitcot.com/about-us/")!
    static let fbURL:URL = URL(string: "https://www.facebook.com/")!
    static let twitterURL:URL = URL(string: "https://twitter.com/")!
    static let instagramURL:URL = URL(string: "https://www.instagram.com/")!
}

class UserSession{
    static let sharedInstance = UserSession()
    var user:User?
}

struct UserDefaultKey{
    static let kUserkey = "USER_KEY"
}

struct MessageString{
    
    static let emailRegister = "Your email is not register with us!"
    static let emailPassNotMatch = "Email and password not match"
    static let passwordNotMatch = "password do not match"
    static let enterFullName = "Please enter full name"
    static let enterEmail = "Please enter email"
    static let enterMobile = "Please enter mobile no."
    static let enterDateOfBirth = "Please enter date of birth"
    static let enterPassword = "Please enter password"
    static let enterConfimPass = "Please enter confirm password"
    static let passMatch = "Password's not matched"
    static let signUp = "SignUp Successful"
    static let emailCheck = "Please enter valid Email"
    static let numberCheck = "Phone number should be in formatted properly"
    static let passWordCheck = "Password needs to have min of 8 chars, 1 Cap, 1 special char, 1 number"
    static let pleaseFillAll = "Please fill all fields first"
    
    // MatchRegx
    static let match = "self MATCHES%@"
    static let passwordRgx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
    static let emailRgx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
}

struct ColorCode{
    
    static let appRed = UIColor(named: "AppRed")
    static let appThemeColor = UIColor(named: "AppThemeColor")
}
