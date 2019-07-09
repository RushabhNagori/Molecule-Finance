//
//  Amount.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/8/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class Amount: UIViewController {
    var ref: DatabaseReference!
    
    @IBOutlet weak var amount: UITextField!
    @IBAction func continuePressed(_ sender: Any) {
        let intAmount = Int(amount.text!)
        if intAmount ?? 0 >= 500 {
            ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
            self.ref.child("basics/size").setValue(intAmount)
            performSegue(withIdentifier: "amountToRisk", sender: self)
        }
    }
}
