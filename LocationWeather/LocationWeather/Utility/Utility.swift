//
//  Utility.swift
//  LocationWeather
//
//  Created by bitcot on 10/07/22.
//

import Foundation
import UIKit
import Lottie
import SnapKit
import MapKit
import CoreLocation

extension UIViewController{
    func setAnimationView(animationName:String, containerView:UIView)->AnimationView{
        let animation = AnimationView()
        animation.animation = Animation.named(animationName)
        animation.contentMode = .scaleAspectFill
        animation.loopMode = .loop
        animation.play()
        animation.frame = view.frame
        containerView.addSubview(animation)
        
        return animation
    }
    func setSubAnimation(animationName:String, containerView:UIView)-> AnimationView{
        let animation = AnimationView()
        animation.animation = Animation.named(animationName)
        animation.contentMode = .scaleAspectFill
        animation.loopMode = .loop
        animation.play()
        containerView.addSubview(animation)
        animation.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        animation.backgroundColor = UIColor.clear
        return animation
    }
    
    func showAlert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .default)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}



class AnnotationPin: NSObject, MKAnnotation{
   
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String, Subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
    }
}

struct Utility{
 static func timeStampToDate(unixtimeInterval:Double, text1:UILabel, format:String?){
    let date = Date(timeIntervalSince1970: unixtimeInterval)
    let dateFormatter = DateFormatter()
    dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
    dateFormatter.locale = NSLocale.current
    dateFormatter.dateFormat = format
    let strDate = dateFormatter.string(from: date)
    text1.text! = "\(strDate)"
}
}
