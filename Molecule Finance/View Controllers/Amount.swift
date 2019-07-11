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
        else {
            let alert = UIAlertController(title: "Invalid Value", message: "Portfolio size must be $500 or greater", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
