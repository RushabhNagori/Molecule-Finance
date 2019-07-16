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
    var title = String()
    var value = Int()
    var path = String()
    var opened : Bool = false
    
    init(title: String, value: Int, path: String){
        self.title = title
        self.value = value
        self.path = path
    }
}

class SectorsTable: UITableViewController {
    
    var tableViewData = [customCell]()
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        tableViewData = [customCell(title: "Financials", value: 0, path: "advanced/financials"), customCell(title: "Healthcare", value: 0, path: "advanced/healthcare"), customCell(title: "Technology", value: 0, path: "advanced/technology")]
        tableViewData.sort {$0.title < $1.title}
        tableView.register(UINib(nibName: "questionsCell", bundle: nil), forCellReuseIdentifier: "advancedQuestionsCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "advancedQuestionsCell", for: indexPath) as! questionsCell
        cell.sectorLabel.text = tableViewData[indexPath.row].title
        tableView.beginUpdates()
        tableView.endUpdates()
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! questionsCell
        
        tableViewData[indexPath.row].opened.toggle()
        
        cell.toggleStatus()
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableViewData[indexPath.row].opened == true {
            return 99.5
        }
        else {
            return 40.5
        }

    }
    
}
