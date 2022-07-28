//
//  EventsTableViewCell.swift
//  TabBarProgramatically
//
//  Created by bitcot on 21/06/22.
//

import UIKit

class EventsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView:UIView!
    @IBOutlet weak var img:UIImageView!
    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var detail:UILabel!
    
    static let identifier = String(describing: EventsTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 15
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.lightGray.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureEventCell(event:Event){
    
        self.img.image = event.image
        self.title.text = event.title
        self.detail.text = event.detail
         
     }
    
}
