//
//  MemoriesVcTableViewCell.swift
//  TabBarProgramatically
//
//  Created by bitcot on 22/06/22.
//

import UIKit

class MemoriesVcTableViewCell: UITableViewCell {

    @IBOutlet weak var title:UILabel!
    @IBOutlet weak var detail:UILabel!
    @IBOutlet weak var date:UILabel!
    
    static let identifier = String(describing: MemoriesVcTableViewCell.self)
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(memory:Memory){
        
        let user = memory.owner
        self.title.text = memory.title
        self.detail.text = memory.detail
        self.date.text = memory.date
       
    }
    
    
}
