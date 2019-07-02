//
//  SignupPassword.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/1/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import PopupDialog

class SignupPassword: UIViewController {
    var newUserEmail : String?
    
    @IBOutlet weak var newPassword: UITextField!
    @IBAction func confirmPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: newUserEmail!, password: newPassword.text!) { (user, error) in
            if error != nil {
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode {
                    case .weakPassword:
                        let popup = PopupDialog(title: "Invalid Password", message: "Make sure your password has at least 6 characters")
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
                        let popup = PopupDialog(title: "Unknown Error", message: "Unable to create user due to unknown error. Please try again.")
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
                print ("Successfully created new user.")
            }
        }
    }
    
    override func viewDidLoad() {
        
    }
    
}


