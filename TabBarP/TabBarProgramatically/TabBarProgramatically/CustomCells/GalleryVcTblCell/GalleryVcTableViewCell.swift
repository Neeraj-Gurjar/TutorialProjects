//
//  GalleryVcTableViewCell.swift
//  TabBarProgramatically
//
//  Created by bitcot on 22/06/22.
//

import UIKit

class GalleryVcTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView:UIView!
    @IBOutlet weak var storyImage:UIImageView!
    @IBOutlet weak var title:UILabel!

    static let identifier = String(describing: GalleryVcTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 10
        backView.layer.borderWidth = 0.5
        backView.layer.borderColor = UIColor.lightGray.cgColor
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(gallery:Gallery){
        self.storyImage.image = gallery.storyImage
        self.title.text = gallery.title
        
    }
}
