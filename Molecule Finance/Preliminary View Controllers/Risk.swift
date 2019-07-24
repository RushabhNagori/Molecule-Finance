//
//  Risk.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/8/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class Risk: UIViewController {
    var ref : DatabaseReference!
    @IBOutlet weak var riskPercent: UITextField!
    @IBAction func continuePressed(_ sender: Any) {
        let intRisk = Int(riskPercent.text!)
        if intRisk ?? -1 >= 0 && intRisk ?? -1 <= 100 {
            ref = Database.database().reference().child(Auth.auth().currentUser!.uid)
            self.ref.child("basics/risk").setValue(intRisk)
            self.performSegue(withIdentifier: "riskToUSE", sender: self)
        }
        else {
            let alert = UIAlertController(title: "Invalid Value", message: "Risk percentage should be between 0 and 100", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: { _ in
                
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
