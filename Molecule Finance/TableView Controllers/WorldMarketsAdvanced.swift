//
//  WorldMarketsAdvanced.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/16/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase



class WorldMarketAdvanced: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    var tableData = [customCell]()
    var searchData = [customCell]()
    var searching : Bool = false
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        tableData = [customCell(title: "India", path: "advanced/india"), customCell(title: "Brazil", path: "advanced/brazil"), customCell(title: "Indonesia", path: "advanced/indonesia"), customCell(title: "Pakistan", path: "advanced/pakistan"), customCell(title: "Bangladesh", path: "advanced/bangladesh"), customCell(title: "Japan", path: "advanced/japan"), customCell(title: "Philippines", path: "advanced/philippines"), customCell(title: "Vietnam", path: "advanced/vietnam"), customCell(title: "Turkey", path: "advanced/turkey"), customCell(title: "Thailand", path: "advanced/thailand"), customCell(title: "South Korea", path: "advanced/southKorea"), customCell(title: "Saudi Arabia", path: "advanced/saudiArabia"), customCell(title: "Malaysia", path: "advanced/malaysia"), customCell(title: "United Arab Emirates", path: "advanced/unitedArabEmirates"), customCell(title: "Singapore", path: "advanced/singapore"), customCell(title: "Qatar", path: "advanced/qatar"), customCell(title: "Hong Kong", path: "advanced/hongKong"), customCell(title: "Taiwan", path: "advanced/taiwan"), customCell(title: "Russia", path: "advanced/russia"), customCell(title: "Germany", path: "advanced/germany"), customCell(title: "United Kingdom", path: "advanced/unitedKingdom"), customCell(title: "France", path: "advanced/france"), customCell(title: "Italy", path: "advanced/italy"), customCell(title: "Spain", path: "advanced/spain"), customCell(title: "Poland", path: "advanced/poland"), customCell(title: "Belgium", path: "advanced/belgium"), customCell(title: "Greece", path: "advanced/greece"), customCell(title: "Portugal", path: "advanced/portugal"), customCell(title: "Sweden", path: "advanced/sweden"), customCell(title: "Switzerland", path: "advanced/switzerland"), customCell(title: "Denmark", path: "advanced/denmark"), customCell(title: "Finland", path: "advanced/finland"), customCell(title: "Ireland", path: "advanced/ireland"), customCell(title: "Canada", path: "advanced/canada"), customCell(title: "Cuba", path: "advanced/cuba"), customCell(title: "Mexico", path: "advanced/mexico"), customCell(title: "Colombia", path: "advanced/colombia"), customCell(title: "Argentina", path: "advanced/argentina"), customCell(title: "Peru", path: "advanced/peru"), customCell(title: "Chile", path: "advanced/chile"), customCell(title: "Nigeria", path: "advanced/nigeria"), customCell(title: "Egypt", path: "advanced/egypt"), customCell(title: "South Africs", path: "advanced/southAfrica"), customCell(title: "Australia", path: "advanced/australia"), customCell(title: "New Zealand", path: "advanced/newZealand")]
        tableData.sort {$0.title < $1.title}
        searchData = tableData
        self.table.delegate = self
        self.table.dataSource = self
        self.searchBar.delegate = self
        table.register(UINib(nibName: "questionsCell", bundle: nil), forCellReuseIdentifier: "advancedQuestionsCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchData.count
        }
        else {
            return tableData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "advancedQuestionsCell", for: indexPath) as! questionsCell
        if searching {
            cell.sectorLabel.text = searchData[indexPath.row].title
            cell.dataPath = searchData[indexPath.row].path
        }
        else {
            cell.sectorLabel.text = tableData[indexPath.row].title
            cell.dataPath = tableData[indexPath.row].path
        }
        tableView.beginUpdates()
        tableView.endUpdates()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableData[indexPath.row].opened == true {
            return 120
        }
        else {
            return 60
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searching = true
        
        searchData = tableData.filter({ (titles) -> Bool in
            return titles.title.range(of: searchText, options: [.caseInsensitive]) != nil
        })
        
        self.table.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        table.reloadData()
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
