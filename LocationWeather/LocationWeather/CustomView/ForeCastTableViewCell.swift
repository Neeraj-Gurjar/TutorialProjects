//
//  ForeCastTableViewCell.swift
//  LocationWeather
//
//  Created by bitcot on 11/07/22.
//

import UIKit

class ForeCastTableViewCell: UITableViewCell {
    
    @IBOutlet weak var weather:UILabel!
    @IBOutlet weak var airSpeed:UILabel!
    @IBOutlet weak var icon:UIImageView!
    @IBOutlet weak var day:UILabel!
    @IBOutlet weak var temperature:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
