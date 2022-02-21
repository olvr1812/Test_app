//
//  HeaderCell.swift
//  Test_app
//
//  Created by Оливер Салихов on 18.02.2022.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    @IBOutlet weak var nameSection: UILabel!
    
    static func nib() -> UINib {
        return UINib(nibName: "HeaderCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
