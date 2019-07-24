//
//  PreciousMetals.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class PreciousMetals: UIViewController {
    var ref : DatabaseReference!
    
    @IBOutlet weak var preciousMetalsSegment: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let preciousMetals : Int = Int(preciousMetalsSegment.titleForSegment(at: preciousMetalsSegment.selectedSegmentIndex)!) ?? 0
        self.ref.child("basics/preciousMetals").setValue(preciousMetals)
        self.performSegue(withIdentifier: "preciousMetalsToWorld", sender: self)
    }
    @IBAction func advancedPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "preciousMetalsToAdvanced", sender: self)
    }
}
