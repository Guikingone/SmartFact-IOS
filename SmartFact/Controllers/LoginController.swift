//
//  LoginController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class LoginController: UIViewController
{
    @IBOutlet weak var usernameTxtField: MainForm!
    @IBOutlet weak var passwordTxtField: MainForm!
    
    @IBAction func unwindFromReinitialisationController(unwindSegue: UIStoryboardSegue)
    {
        
    }
    
    @IBAction func LoginUser(_ sender: Any)
    {
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        
        AuthService.instance.loginUser(username: username, password: password)
        { (success) in
            if (success) {
                print("Connexion successfull")
            }
        }
    }
}
