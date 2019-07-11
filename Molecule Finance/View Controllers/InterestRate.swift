//
//  InterestRate.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class InterestRate: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var inflationSegment: UISegmentedControl!
    @IBOutlet weak var interestRateSegment: UISegmentedControl!
    

    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let inflation : Int = Int(inflationSegment.titleForSegment(at: inflationSegment.selectedSegmentIndex)!) ?? 0
        let interestRate : Int = Int(interestRateSegment.titleForSegment(at: interestRateSegment.selectedSegmentIndex)!) ?? 0
        self.ref.child("portfolio/inflation").setValue(inflation)
        self.ref.child("portfolio/interestRate").setValue(interestRate)
        self.performSegue(withIdentifier: "interestToUSMisc", sender: self)
    }
    
    
}
