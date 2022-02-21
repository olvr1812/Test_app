//
//  CellInfo.swift
//  Test_app
//
//  Created by Оливер Салихов on 17.02.2022.
//

import UIKit

@IBDesignable class CellInfo: UITableViewCell {
    
    static func nib() -> UINib {
        
        return UINib(nibName: "CellInfo", bundle: nil)
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var ageField: UITextField!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
