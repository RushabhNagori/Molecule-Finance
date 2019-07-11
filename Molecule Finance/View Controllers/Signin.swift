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
import SVProgressHUD

class Signin: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBAction func signinPressed(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                SVProgressHUD.dismiss()
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode{
                    case .invalidEmail:
                        let alert = UIAlertController(title: "Invalid Email", message: "Please make sure your email is in the format address@website.com and try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                    case .wrongPassword:
                        let alert = UIAlertController(title: "Invalid Email/Password combination", message: "Please check your credentials and try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                    case .userDisabled:
                        let alert = UIAlertController(title: "User disabled", message: "Cannot log you in because your account has been disabled", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                    default:
                        let alert = UIAlertController(title: "Unknown Error", message: "Unable to log you in, please try again", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: {_ in
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
            else {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "signinToStart", sender: self)
            }
        }
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        performSegue(withIdentifier: "forgotPassword", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if email.text != ""{
            if segue.identifier == "forgotPassword"{
                let destinationVC = segue.destination as! ForgotPassword
                destinationVC.emailPassedOver = email.text!
            }
        }
    }
}
