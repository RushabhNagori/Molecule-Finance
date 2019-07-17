//
//  USEquity.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class US: UIViewController {
    
    var ref : DatabaseReference!
    
    @IBOutlet weak var economySegment: UISegmentedControl!
    @IBOutlet weak var largeCapSegment: UISegmentedControl!
    @IBOutlet weak var smallCapSegment: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let economy : Int = Int(economySegment.titleForSegment(at: economySegment.selectedSegmentIndex)!) ?? 0
        let largeCap : Int = Int(largeCapSegment.titleForSegment(at: largeCapSegment.selectedSegmentIndex)!) ?? 0
        let smallCap : Int = Int(smallCapSegment.titleForSegment(at: smallCapSegment.selectedSegmentIndex)!) ?? 0
        self.ref.child("basics/USEconomy").setValue(economy)
        self.ref.child("basics/USLargeCap").setValue(largeCap)
        self.ref.child("basics/USSmallCap").setValue(smallCap)
        self.performSegue(withIdentifier: "USToInterestRate", sender: self)
    }
    
    @IBAction func swipeUp(_ sender: Any) {
        self.performSegue(withIdentifier: "advancedSectors", sender: self)
    }
    @IBAction func advancedPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "advancedSectors", sender: self)
    }
}
