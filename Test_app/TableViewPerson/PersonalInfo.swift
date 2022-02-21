//
//  PersonalInfo.swift
//  Test_app
//
//  Created by Оливер Салихов on 17.02.2022.
//

import UIKit

@IBDesignable class PersonalInfo: UITableViewController {
//    var numberOfRows: [fieldsName]  = []
    
    var kidsArray:[String] = []
    var buttonsTags: [Int] = []
    
    var headerName = ["Персональные данные", "Дети (макс. 5)"]
    var numberOfRows = 3
    
    @IBOutlet var infoCell: UITableView!
    
    
    @objc func buttonAction(sender: UIButton!) {
        //let button: UIButton = sender
        
        let newKid = "newKid"
        kidsArray.append(newKid)
        tableView.insertRows(at: [IndexPath(row: kidsArray.count - 1, section: 1)], with: .automatic)
        if kidsArray.count == 5{
            sender.isHidden = true
        } else {
            sender.isHidden = false
        }
    }
    
    @objc func delKid(sender: UIButton!) {
        
        let indexDel = buttonsTags.firstIndex(of: sender.tag)
        buttonsTags.remove(at: indexDel!)
        kidsArray.remove(at: indexDel!)
        tableView.deleteRows(at: [IndexPath(row: indexDel!, section: 1)], with: .automatic)
        
        
        

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerHeaderCell()
        registerCellInfo()
        registerFooterCell()
        
        tableView.rowHeight = 150

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch(section) {
        case 0:
            numberOfRows = 1
        case 1:
            numberOfRows = kidsArray.count
        default:
            numberOfRows = 1
        }
        
        return numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellInfo = tableView.dequeueReusableCell(withIdentifier: "cellInfoID", for: indexPath) as! CellInfo
        print(indexPath[1], "tableView")
        
       let cellFooter = tableView.dequeueReusableCell(withIdentifier: "footerCellID", for: indexPath) as! footerCell
        
        switch(indexPath.section){
        case 0:
            print(cellInfo.nameField.frame.origin)
            
            print("Координата x \(cellInfo.nameField.frame.origin.x)")
            print("Ширина ячейки: \(cellInfo.nameField.frame.width)")
            
            return cellInfo
            
        case 1:
            let buttonCell: UIButton = UIButton()
            buttonCell.setTitle("Удалить", for: .normal)
            buttonCell.frame = CGRect(x: 230, y: 15, width: 150, height: 40)
            buttonCell.setTitleColor(.red, for: .normal)
            buttonCell.backgroundColor = UIColor.white
            buttonCell.clipsToBounds = true
            buttonCell.layer.cornerRadius = CGFloat(20)
            buttonCell.layer.borderWidth = 2
            buttonCell.layer.borderColor = UIColor.red.cgColor
            buttonCell.configuration?.cornerStyle = .fixed
            buttonCell.tag = indexPath[1]
            print(buttonCell.tag)
            buttonCell.addTarget(self, action: #selector(delKid), for: .touchUpInside)
                
            buttonsTags.append(buttonCell.tag)
    
            cellInfo.addSubview(buttonCell)
            return cellInfo
            
        default:
            return cellFooter
            
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCellID") as! HeaderCell
        
        //let segmentedControl = UISegmentedControl(frame: CGRect(x: 10, y: 5, width: tableView.frame.width - 20, height: 30))
        
        print(section)
        
        switch(section) {
            
        case 0:
            headerCell.nameSection.text = "Персональные данные"
        case 1:
            headerCell.nameSection.text = "Дети (макс. 5)"
        default:
            headerCell.removeFromSuperview()
        }
        
        if section == 1{
            let button: UIButton = UIButton(type: .contactAdd)
            button.setTitle("Добавить ребенка", for: .normal)
            button.frame = CGRect(x: 200, y: 10, width: 190, height: 30)
            button.setTitleColor(.systemBlue, for: .normal)
            button.backgroundColor = UIColor.white
            button.clipsToBounds = true
            button.layer.cornerRadius = CGFloat(15)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.systemBlue.cgColor
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.configuration?.cornerStyle = .fixed
    
            headerCell.addSubview(button)
            
        }

        
        
        //headerCell.addSubview(segmentedControl)
        headerCell.backgroundColor = UIColor.white
        
        
        return headerCell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 0.1
        } else {
            return 40
        }
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableView.automaticDimension
//
//    }
////
//    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//
//
//        }
////
//
//    }
//
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PersonalInfo {
    func registerCellInfo() {
        tableView.register(CellInfo.nib(), forCellReuseIdentifier: "cellInfoID")
    }
}

extension PersonalInfo {
    func registerHeaderCell() {
        tableView.register(HeaderCell.nib(), forCellReuseIdentifier: "headerCellID")
    }
}

extension PersonalInfo {
    func registerFooterCell() {
        tableView.register(footerCell.nib(), forCellReuseIdentifier: "footerCellID")
    }
}
