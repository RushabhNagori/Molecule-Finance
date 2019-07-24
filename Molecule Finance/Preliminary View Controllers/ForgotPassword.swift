//
//  ForgotPassword.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 7/2/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth
import Firebase
import SVProgressHUD
import PopupDialog

class ForgotPassword: UIViewController {
    var emailPassedOver : String = ""
    @IBOutlet weak var email: UITextField!
    @IBAction func resetPassword(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().sendPasswordReset(withEmail: email.text!) { (error) in
            if error != nil {
                SVProgressHUD.dismiss()
                let popup = PopupDialog(title: "Invalid Email", message: "Make sure you are a registered user and have entered the correct email address")
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
            else{
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "resetPassword", sender: self)
            }
        }
    }
    override func viewDidLoad() {
        if emailPassedOver != ""{
            email.text = emailPassedOver
        }
    }
}
