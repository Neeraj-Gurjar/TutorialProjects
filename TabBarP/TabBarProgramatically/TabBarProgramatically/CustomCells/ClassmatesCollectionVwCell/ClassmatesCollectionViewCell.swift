//
//  ClassmatesCollectionViewCell.swift
//  TabBarProgramatically
//
//  Created by bitcot on 16/06/22.
//

import UIKit

protocol ClassmatesCollectionViewCellDelegate{
    func didTapOnFavouriteButton(cell:ClassmatesCollectionViewCell)
}

class ClassmatesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var vwBackgroundView:UIView!
    @IBOutlet weak var imgProfile:UIImageView!
    @IBOutlet weak var lblName:UILabel!
    @IBOutlet weak var lblContactNumber:UILabel!
    @IBOutlet weak var imgFavorite:UIImageView!
    
    var delegate : ClassmatesCollectionViewCellDelegate?
    static let identifier = String(describing: ClassmatesCollectionViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 15
    }
    
   func configureCell(user:User, isFavourited:Bool = false){
   
        imgProfile.image = UIImage(named: user.profileImage) 
        lblName.text = user.name
        lblContactNumber.text = user.contactNo
       if isFavourited{
           imgFavorite.image = UIImage(named: "FavoritesFilled")
       }else{
           imgFavorite.image = UIImage(named: "Favorites")
       }
        
    }
    
    @IBAction func btnAFavorites(){
        delegate?.didTapOnFavouriteButton(cell: self)
        
    }
    
}
