//
//  USMisc.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/9/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase

class USMisc: UIViewController {
    var ref : DatabaseReference!
    
    @IBOutlet weak var USDollarSegment: UISegmentedControl!
    @IBOutlet weak var municipalBondSegment: UISegmentedControl!
    @IBOutlet weak var realEstateSegment: UISegmentedControl!
    
    @IBAction func continuePressed(_ sender: Any) {
        ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
        let USDollar : Int = Int(USDollarSegment.titleForSegment(at: USDollarSegment.selectedSegmentIndex)!) ?? 0
        let municipalBond : Int = Int(municipalBondSegment.titleForSegment(at: municipalBondSegment.selectedSegmentIndex)!) ?? 0
        let realEstate : Int = Int(realEstateSegment.titleForSegment(at: realEstateSegment.selectedSegmentIndex)!) ?? 0
        
        self.ref.child("portfolio/USDollar").setValue(USDollar)
        self.ref.child("portfolio/municipalBond").setValue(municipalBond)
        self.ref.child("portfolio/realEstate").setValue(realEstate)
        self.performSegue(withIdentifier: "USMiscToVolatility", sender: self)
    }
}
