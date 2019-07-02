//
//  Signin.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/2/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class Signin: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func signinPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                print (error!)
            }
            else {
                print ("sign in successful!")
            }
        }
    }
}
