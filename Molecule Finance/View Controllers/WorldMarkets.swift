//
//  WorldMarkets.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class WorldMarkets: UIViewController {
    var ref : DatabaseReference!
    
    @IBOutlet weak var europeSegment: UISegmentedControl!
    @IBOutlet weak var emergingMarketsSegment: UISegmentedControl!
    @IBOutlet weak var china: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let europe : Int = Int(europeSegment.titleForSegment(at: europeSegment.selectedSegmentIndex)!) ?? 0
        let emergingMarkets : Int = Int(emergingMarketsSegment.titleForSegment(at: emergingMarketsSegment.selectedSegmentIndex)!) ?? 0
        let chinaMarkets : Int = Int(china.titleForSegment(at: china.selectedSegmentIndex)!) ?? 0
        self.ref.child("portfolio/europe").setValue(europe)
        self.ref.child("portfolio/emergingMarkets").setValue(emergingMarkets)
        self.ref.child("portfolio/china").setValue(chinaMarkets)
        self.performSegue(withIdentifier: "worldMarketsToGas", sender: self)
    }
}
