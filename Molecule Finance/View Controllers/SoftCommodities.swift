//
//  SoftCommodities.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class SoftCommodities: UIViewController {
    var ref : DatabaseReference!
    
    @IBOutlet weak var softCommoditiesSegment: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let softCommodities : Int = Int(softCommoditiesSegment.titleForSegment(at: softCommoditiesSegment.selectedSegmentIndex)!) ?? 0
        self.ref.child("portfolio/softCommodities").setValue(softCommodities)
    }
}
