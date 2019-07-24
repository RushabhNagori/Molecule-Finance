//
//  StockChartDisplay.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/22/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Charts

class StockChartDisplay: UITableViewCell {

    @IBOutlet weak var chart: LineChartView!
    var dataEntries = [PieChartDataEntry]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
