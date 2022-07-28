//
//  LiveTableViewCell.swift
//  LocationWeather
//
//  Created by bitcot on 15/07/22.
//

import UIKit

class LiveTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainBackgroundVw:UIView!
    @IBOutlet weak var img:UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        mainBackgroundVw.layer.cornerRadius = 10
        mainBackgroundVw.layer.shadowColor = UIColor.darkGray.cgColor
        mainBackgroundVw.layer.shadowRadius = 10
        mainBackgroundVw.layer.shadowOffset = CGSize.zero
        mainBackgroundVw.layer.shadowOpacity = 1
        img.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
