//
//  AirDataTableViewCell.swift
//  BitcotLevel_2
//
//  Created by bitcot on 02/06/22.
//

import UIKit

class AirDataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundMainBg_View:UIView!
    @IBOutlet weak var airLineImage:UIImageView!
    @IBOutlet weak var titleNameLabel:UILabel!
    @IBOutlet weak var airLineName_Label:UILabel!
    @IBOutlet weak var numberofPasse_Label:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundMainBg_View.layer.masksToBounds = true
        backgroundMainBg_View.layer.cornerRadius = 20
        backgroundMainBg_View.layer.shadowOpacity = 1
        backgroundMainBg_View.layer.shadowColor = UIColor.red.cgColor
        backgroundMainBg_View.layer.shadowRadius = 10
        backgroundMainBg_View.layer.borderColor = UIColor.lightGray.cgColor
        backgroundMainBg_View.layer.borderWidth = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
