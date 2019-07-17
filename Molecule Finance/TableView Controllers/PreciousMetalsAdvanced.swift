//
//  PreciousMetalsAdvanced.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/16/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class PreciousMetalsAdvanced: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableData = [customCell]()
    var searchData = [customCell]()
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        tableData = [customCell(title: "Gold", path: "advanced/gold"), customCell(title: "Silver", path: "advanced/silver"), customCell(title: "Palladium", path: "advanced/palladium"), customCell(title: "Platinum", path: "advanced/platinum")]
        tableData.sort {$0.title < $1.title}
        table.register(UINib(nibName: "questionsCell", bundle: nil), forCellReuseIdentifier: "advancedQuestionsCell")
        self.table.delegate = self
        self.table.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "advancedQuestionsCell") as! questionsCell
        cell.sectorLabel.text = tableData[indexPath.row].title
        cell.dataPath = tableData[indexPath.row].path
        tableView.beginUpdates()
        tableView.endUpdates()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableData[indexPath.row].opened {
            return 120.0
        }
        else {
            return 60.0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! questionsCell
        
        tableData[indexPath.row].opened.toggle()
        
        cell.toggleStatus()
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func confirmPressed(_ sender: Any) {
        let ref : DatabaseReference =  Database.database().reference().child(Auth.auth().currentUser!.uid)
//        for index in 0 ... (tableData.count - 1) {
//            let cell = table.cellForRow(at: IndexPath(row: index, section: 0)) as! questionsCell
//            let value : Int = Int(cell.sectorSegment.titleForSegment(at: cell.sectorSegment.selectedSegmentIndex)!) ?? 0
//            if value != 0 {
//                ref.child(tableData[index].path).setValue(value)
//            }
//            self.dismiss(animated: true, completion: nil)
//        }
        for index in 0 ... (advancedGlobal.count - 1) {
            ref.child(advancedGlobal[index].path).setValue(advancedGlobal[index].value)
        }

    }
}
