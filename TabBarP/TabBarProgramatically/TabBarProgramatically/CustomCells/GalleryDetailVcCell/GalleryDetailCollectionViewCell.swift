//
//  GalleryDetailCollectionViewCell.swift
//  TabBarProgramatically
//
//  Created by bitcot on 22/06/22.
//

import UIKit

class GalleryDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storyimg:UIImageView!
    
    static let identifier = String(describing: GalleryDetailCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func configureCell(gallery:Gallery){
        self.storyimg.image = gallery.storyImage
    }
}
