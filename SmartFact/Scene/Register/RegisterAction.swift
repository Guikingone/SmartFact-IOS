//
//  RegisterController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class RegisterAction: UIViewController
{
    @IBOutlet weak var emailTxtField: MainForm!
    @IBOutlet weak var usernameTxtField: MainForm!
    @IBOutlet weak var passwordTxtField: MainForm!
    @IBOutlet weak var passwordRptTxtField: MainForm!
    
    @IBAction func createAccountAction(_ sender: Any)
    {
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        guard let email = emailTxtField.text , emailTxtField.text != "" else { return }
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        guard let passwordRpt = passwordRptTxtField.text , passwordRptTxtField.text != "" else { return }

        if (passwordRpt != password) {
            // TODO : Show an alert in order to inform the user.
            return
        }
        
        RegisterInteractor().register(username: username, plainPassword: password, email: email, success: { (created) in
            self.performSegue(withIdentifier: "ConnexionSegue", sender: self)
        }) { (failure) in
            self.registerFailure()
        }
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetails()
    }
}
