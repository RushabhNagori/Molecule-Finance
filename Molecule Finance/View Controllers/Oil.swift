//
//  Oil.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class Oil: UIViewController {
    var ref : DatabaseReference!
    
    @IBOutlet weak var oilSegment: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let oil : Int = Int(oilSegment.titleForSegment(at: oilSegment.selectedSegmentIndex)!) ?? 0
        self.ref.child("portfolio/oil").setValue(oil)
        self.performSegue(withIdentifier: "oilToSoftCommodities", sender: self)
    }
}
