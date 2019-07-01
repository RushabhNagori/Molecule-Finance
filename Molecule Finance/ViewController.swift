//
//  ViewController.swift
//  Molecule Finance
//
//  Created by Rushabh Nagori on 6/29/19.
//  Copyright © 2019 Rushabh Nagori. All rights reserved.
//

import UIKit
import FirebaseCore
import Firebase
import FirebaseAuth
import PopupDialog

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBAction func signUp(_ sender: Any) {
        if email.text == "" {
            let popup = PopupDialog(title: "Empty email address", message: "Please enter a valid email address to continue")
            let okayButton = DefaultButton(title: "Okay"){}
            let containerAppearence = PopupDialogContainerView.appearance()
            containerAppearence.backgroundColor = UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.0)
            let messageAppearence = PopupDialogDefaultView.appearance()
            messageAppearence.messageColor = .lightGray
            messageAppearence.messageFont = .systemFont(ofSize: 14)
            messageAppearence.titleFont = .systemFont(ofSize: 14)
            messageAppearence.titleColor = .white
            let buttonAppearence = DefaultButton.appearance()
            buttonAppearence.titleColor = UIColor(red: 1.48, green: 0.55, blue: 2.55, alpha: 1.00)
            buttonAppearence.titleFont = .systemFont(ofSize: 14.0)
            popup.addButton(okayButton)
            self.present(popup, animated: true, completion: nil)
        }

        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            if error != nil {
                print (error!)
            }
            else {
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

