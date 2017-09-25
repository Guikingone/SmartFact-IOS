//
//  PasswordResetAction.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class PasswordResetTokenAction: UIViewController
{
    @IBOutlet weak var emailTxtField: MainForm!
    @IBOutlet weak var usernameTxtField: MainForm!
    
    @IBAction func passwordResetTokenRequest(_ sender: Any)
    {
        guard let email = emailTxtField.text , emailTxtField.text != "" else { return }
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        
        PasswordResetTokenInteractor().resetPassword(email: email, username: username, success: { (accepted) in
            self.performSegue(withIdentifier: "resetPasswordFinalSegue", sender: self)
        }) { (rejected) in
            print("Rejected !")
        }
    }
    
    @IBAction func cancelPasswordReset(_ sender: Any)
    {
        dismissDetails()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordResetFinalAction = segue.destination as? PasswordResetFinalAction {
            passwordResetFinalAction.token = PasswordResetTokenInteractor().passwordResetToken
        }
    }
}
