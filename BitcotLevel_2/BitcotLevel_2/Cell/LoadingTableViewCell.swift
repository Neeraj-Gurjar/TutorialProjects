//
//  LoadingTableViewCell.swift
//  BitcotLevel_2
//
//  Created by bitcot on 02/06/22.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView:UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorView.startAnimating()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
