//
//  ForgotPasswordController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 16/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class ForgotPasswordController: UIViewController
{
    @IBOutlet weak var forgotPasswordEmailTxtField: MainForm!
    @IBOutlet weak var forgotPasswordUsernameTxtField: MainForm!
    
    @IBAction func resetPassword(_ sender: Any)
    {
        guard let email = forgotPasswordEmailTxtField.text , forgotPasswordEmailTxtField.text != "" else { return }
        guard let username = forgotPasswordUsernameTxtField.text , forgotPasswordUsernameTxtField.text != "" else { return }
        
        AuthService.instance.resetPasswordToken(email: email, username: username)
        {
            (success) in
            
            if (success) {
                if AuthService.instance.allowedToResetPassword {
                    self.performSegue(withIdentifier: "ForgotPasswordSegue", sender: self)
                }
            }
        }
    }
}
