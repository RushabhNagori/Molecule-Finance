//
//  SectorsTable.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/10/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

struct customCell {
    var opened : Bool = false
    var title = String()
}

class SectorsTable: UITableViewController {
    
    var tableViewData = [customCell]()
    
    override func viewDidLoad() {
        tableViewData = [customCell(opened: true, title: "Financials"), customCell(opened: false, title: "Technology"), customCell(opened: false, title: "Healthcare"), customCell(opened: false, title: "Utilities")]
        tableView.register(UINib(nibName: "questionsCell", bundle: nil), forCellReuseIdentifier: "advancedQuestionsCell") 
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true{
            return 2
        }
        else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "sectorsCell")
            cell?.textLabel?.text = tableViewData[indexPath.section].title
            cell?.textLabel?.textColor = UIColor.white
            return cell!
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "advancedQuestionsCell", for: indexPath) as! questionsCell
            return cell
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableViewData[indexPath.section].opened = !tableViewData[indexPath.section].opened
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
}
