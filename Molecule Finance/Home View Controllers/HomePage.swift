//
//  HomePage.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/22/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Alamofire
import FirebaseDatabase
import Firebase

class HomePage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    
    var numberOfPositions : Int?
    var ref : DatabaseReference?
    
    let urlIntraday : String = "https://www.alphavantage.co/query?function=TIME_SERIES_INTRADAY&symbol="
    let ticker : String = "MSFT"
    let interval : String = "&interval=5min&"
    let apiKey = "apikey=ZCIU9G251280UJOW"
    var urlRequest : String = ""
    
    override func viewDidLoad() {
        self.table.delegate = self
        self.table.dataSource = self
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid).child("portfolio")
        self.table.register(UINib(nibName: "StockChartDisplay", bundle: nil), forCellReuseIdentifier: "stockChart")
        
//        Get number of positions in the portfolio for number of cells in tableview
        ref!.observe(.value) { (snapshot : DataSnapshot!) in
            self.numberOfPositions = Int(snapshot.childrenCount)
            self.table.reloadData()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        else {
            return self.numberOfPositions ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let chartCell = table.dequeueReusableCell(withIdentifier: "stockChart", for: IndexPath(row: indexPath.row, section: 0)) as! StockChartDisplay
        let chartCell = table.dequeueReusableCell(withIdentifier: "stockChart", for: indexPath) as! StockChartDisplay
        if indexPath.section == 0 {
            return chartCell
        }
        else {
            return chartCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 250
        }
        else {
            return 200
        }
    }
    
    // Fetch stock data using ticker as input
    func updateStockData(ticker : String) {
        urlRequest = urlIntraday + ticker + interval + apiKey
    }
}
