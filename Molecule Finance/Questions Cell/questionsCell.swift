//
//  questionsCell.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit

class questionsCell: UITableViewCell {
    var selectedValue : Int = 0
    
    @IBAction func segmentChanged(_ sender: Any) {
        selectedValue = Int(sectorSegment.titleForSegment(at: sectorSegment.selectedSegmentIndex)!) ?? 0
    }
    
    @IBOutlet weak var background: UIView!
    
    @IBOutlet weak var sectorLabel: UILabel!
    
    @IBOutlet weak var sectorSegment: UISegmentedControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func toggleStatus() {
        self.sectorSegment.isHidden.toggle()
        self.sectorSegment.isEnabled.toggle()
    }
    
}
