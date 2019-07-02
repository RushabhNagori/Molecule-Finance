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
import PopupDialog
import SVProgressHUD

class Signin: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func signinPressed(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil{
                SVProgressHUD.dismiss()
                if let errCode = AuthErrorCode(rawValue: error!._code) {
                    switch errCode{
                    case .invalidEmail:
                        let popup = PopupDialog(title: "Invalid Email", message: "Please make sure your email is in the right format and try again")
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
                    case .wrongPassword:
                        let popup = PopupDialog(title: "Invalid Email/Password combination", message: "Please check your credentials and try again.")
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
                    case .userDisabled:
                        let popup = PopupDialog(title: "User disabled", message: "Cannot log you in because your account has been disabled.")
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
                        let popup = PopupDialog(title: "Unknown Error", message: "Unable to log you in, please try again.")
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
                SVProgressHUD.dismiss()
                print ("sign in successful!")
            }
        }
    }
    
    
}
