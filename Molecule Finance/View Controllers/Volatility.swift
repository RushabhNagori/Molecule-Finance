//
//  Volatility.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class Volatility: UIViewController {
    var ref : DatabaseReference!
    @IBOutlet weak var volatilitySegment: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let volatility : Int = Int(volatilitySegment.titleForSegment(at: volatilitySegment.selectedSegmentIndex)!) ?? 0
        self.ref.child("portfolio/volatility").setValue(volatility)
        self.performSegue(withIdentifier: "volatilityToPreciousMetals", sender: self)
    }
}
