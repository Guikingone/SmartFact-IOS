//
//  RegisterController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class RegisterController: UIViewController
{
    @IBOutlet weak var usernameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var passwordRptTextField: UITextField!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func createAccountAction(_ sender: Any)
    {
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        guard let email = emailTxtField.text , emailTxtField.text != "" else { return }
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        guard let passwordRpt = passwordRptTextField.text , passwordTxtField.text != "" else { return }

        if (password != passwordRpt) {
            return
        }
        
        AuthService.instance.registerUser(username: username, email: email, password: password)
        { (success) in
            if success {
                print("User registrered !")
            }
        }
    }
}
