//
//  ResetPasswordController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class ResetPasswordController: UIViewController
{
    @IBOutlet weak var passwordTxtField: MainForm!
    
    @IBAction func resetPassword(_ sender: Any)
    {
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        
        AuthService.instance.resetPassword(password: password) {
            (success) in
            
            if success {
                self.performSegue(withIdentifier: "PasswordUpdated", sender: self)
            }
        }
    }
}
