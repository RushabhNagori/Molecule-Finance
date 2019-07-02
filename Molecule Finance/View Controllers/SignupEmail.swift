//
//  SignupEmail.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/1/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import PopupDialog

class SignupEmail: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBAction func continueButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: email.text!, password: "Password$1") { (user, error) in
            
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    
                    switch errCode {
                    case .emailAlreadyInUse:
                        let popup = PopupDialog(title: "Email is already in use", message: "Sign in with existing email or create an account with a new email")
                        let cancelButton = CancelButton(title: "Cancel", action: .none)
                        let signinButton = DefaultButton(title: "Sign In", action: {
                            self.performSegue(withIdentifier: "signupToSignin", sender: self)
                        })
                        popup.addButton(cancelButton)
                        popup.addButton(signinButton)
                        PopupDialogContainerView.appearance().backgroundColor = UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00)
                        let buttonAppearence = DefaultButton.appearance()
                        buttonAppearence.titleColor = .magenta
                        let messageAppearence = PopupDialogDefaultView.appearance()
                        messageAppearence.titleColor = .white
                        messageAppearence.messageColor = .lightGray
                        popup.buttonAlignment = .horizontal
                        cancelButton.titleColor = .white
                        self.present(popup, animated: true, completion: nil)
                    
                    case .invalidEmail:
                        let popup = PopupDialog(title: "Invalid Email", message: "Email must be of type email@website.com")
                        let okayButton = DefaultButton(title: "Okay", action: {
                            
                        })
                        popup.addButton(okayButton)
                        PopupDialogContainerView.appearance().backgroundColor = UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00)
                        let buttonAppearence = DefaultButton.appearance()
                        buttonAppearence.titleColor = .white
                        let messageAppearence = PopupDialogDefaultView.appearance()
                        messageAppearence.titleColor = .white
                        messageAppearence.messageColor = .lightGray
                        self.present(popup, animated: true, completion: nil)
                    
                    default:
                        let popup = PopupDialog(title: "Unknown Error", message: "Unable to sign up due to unknown error. Please try again.")
                        let okayButton = DefaultButton(title: "Okay", action: {
                        })
                        popup.addButton(okayButton)
                        PopupDialogContainerView.appearance().backgroundColor = UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00)
                        let buttonAppearence = DefaultButton.appearance()
                        buttonAppearence.titleColor = .white
                        let messageAppearence = PopupDialogDefaultView.appearance()
                        messageAppearence.titleColor = .white
                        messageAppearence.messageColor = .lightGray
                        self.present(popup, animated: true, completion: nil)
                    }
                }
            }
            
            else {
                Auth.auth().currentUser?.delete(completion: { (error) in
                })
                self.performSegue(withIdentifier: "signupEmailToPassword", sender: self)
            }
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signupEmailToPassword"{
            let destinationVC = segue.destination as! SignupPassword
            destinationVC.newUserEmail = email.text!
        }
    }
}

