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
    @IBOutlet weak var UsernameTxtField: UITextField!
    @IBOutlet weak var EmailTxtField: UITextField!
    @IBOutlet weak var PasswordTxtField: UITextField!
    @IBOutlet weak var PasswordRptTextField: UITextField!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func createAccountAction(_ sender: Any)
    {
        guard let username = UsernameTxtField.text , UsernameTxtField.text != "" else { return }
        guard let email = EmailTxtField.text , EmailTxtField.text != "" else { return }
        guard let password = PasswordTxtField.text , PasswordTxtField.text != "" else { return }
        guard let passwordRpt = PasswordRptTextField.text , PasswordTxtField.text != "" else { return }

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
