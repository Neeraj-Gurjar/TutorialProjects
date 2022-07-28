//
//  SideMenuTableViewCell.swift
//  TabBarProgramatically
//
//  Created by bitcot on 17/06/22.
//

import UIKit

class SideMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var icon:UIImageView!
    @IBOutlet weak var title:UILabel!

    static let identifier = String(describing: SideMenuTableViewCell.self)

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(menuOptions:SideBarMenu){
        self.icon.image = menuOptions.icon
        self.title.text = menuOptions.title
    }
    
}
