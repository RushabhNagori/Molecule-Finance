//
//  SectorsView.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/15/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

//struct customCell {
//    var title = String()
//    var value = Int()
//    var path = String()
//}

class SectorsView: UIViewController {
    
    @IBOutlet weak var subView: UIView!
    //    var tableViewData = [customCell]()
    
    
    override func viewDidLoad() {
//        tableViewData = [customCell(title: "Financials", value: 0, path: "advanced/financials"), customCell(title: "Healthcare", value: 0, path: "advanced/healthcare"), customCell(title: "Technology", value: 0, path: "advanced/technology")]
//        table.register(UINib(nibName: "questionsCell", bundle: nil), forCellReuseIdentifier: "advancedQuestionsCell")
//
//        self.table.delegate = self
//        self.table.dataSource = self
        
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tableViewData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "advancedQuestionsCell", for: indexPath) as! questionsCell
//        cell.sectorLabel.text = tableViewData[indexPath.row].title
//        return cell
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 120.0
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        table.reloadData()
//    }
    
    @IBAction func confirmPressed(_ sender: Any) {
         
    }
    
}
