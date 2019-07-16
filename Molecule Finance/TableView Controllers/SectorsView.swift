//
//  SectorsView.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/15/19.
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

class SectorsView: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    var tableViewData = [customCell]()
    var searchBarData = [customCell]()
    var searching : Bool = false
    
    override func viewDidLoad() {
        tableViewData = [customCell(title: "Financials", value: 0, path: "advanced/financials"), customCell(title: "Healthcare", value: 0, path: "advanced/healthcare"), customCell(title: "Technology", value: 0, path: "advanced/technology"), customCell(title: "Communications", value: 0, path: "advanced/communications"), customCell(title: "Consumer Cyclicals", value: 0, path: "advanced/consumerCyclicals"), customCell(title: "Materials", value: 0, path: "advanced/materials"), customCell(title: "Utilities", value: 0, path: "advanced/utilities"), customCell(title: "Industrials", value: 0, path: "advanced/industrials")]
        table.register(UINib(nibName: "questionsCell", bundle: nil), forCellReuseIdentifier: "advancedQuestionsCell")
        tableViewData.sort {$0.title < $1.title}
        searchBarData = tableViewData
        self.table.delegate = self
        self.table.dataSource = self
        searchBar.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchBarData.count
        }
        else {
            return tableViewData.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "advancedQuestionsCell", for: indexPath) as! questionsCell
        if searching {
            cell.sectorLabel.text = searchBarData[indexPath.row].title
        }
        else {
            cell.sectorLabel.text = tableViewData[indexPath.row].title
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableViewData[indexPath.row].opened == true {
            return 99.5
        }
        else {
            return 40.5
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! questionsCell
        
        tableViewData[indexPath.row].opened.toggle()
        
        cell.toggleStatus()
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func confirmPressed(_ sender: Any) {
        let ref : DatabaseReference =  Database.database().reference().child(Auth.auth().currentUser!.uid)
        for index in 0 ... (tableViewData.count - 1) {
            let cell = table.cellForRow(at: IndexPath(row: index, section: 0)) as! questionsCell
            let value : Int = Int(cell.sectorSegment.titleForSegment(at: cell.sectorSegment.selectedSegmentIndex)!) ?? 0
            ref.child(tableViewData[index].path).setValue(value)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        
        searchBarData = tableViewData.filter({ (titles) -> Bool in
            return titles.title.range(of: searchText, options: [.caseInsensitive]) != nil
        })
        
        self.table.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        table.reloadData()
    }
}
