//
//  LoginAction.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 22/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class LoginAction: UIViewController
{
    @IBOutlet weak var usernameTxtField: MainForm!
    @IBOutlet weak var passwordTxtField: MainForm!
    
    override func viewDidAppear(_ animated: Bool)
    {
        //biometricLogin()
    }
    
    @IBAction func resetPassword(_ sender: Any)
    {
        guard let passwordResetAction = storyboard?.instantiateViewController(withIdentifier: "PasswordResetTokenAction") as? PasswordResetTokenAction else { return }
        presentDetails(passwordResetAction)
    }
    
    @IBAction func LoginUser(_ sender: Any)
    {
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        
        LoginInteractor().login(username: username, password: password, success: { (logged) in
            self.performSegue(withIdentifier: "LoggedInSegue", sender: self)
        }) { (failed) in
            // TODO
        }
    }
}
