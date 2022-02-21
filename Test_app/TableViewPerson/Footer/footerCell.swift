//
//  footerCell.swift
//  Test_app
//
//  Created by Оливер Салихов on 20.02.2022.
//

import UIKit

class footerCell: UITableViewCell {
    
    @IBAction func clearBtn(_ sender: Any) {
        let clearView = UIStoryboard(name: "Main", bundle: nil)
        guard let PersonalInfo = clearView.instantiateViewController(withIdentifier: "tableViewID") as? PersonalInfo else { return }
        print(PersonalInfo.kidsArray)
        
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "footerCell", bundle: nil)
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
