//
//  PasswordResetAction.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class PasswordResetAction: UIViewController
{
    @IBOutlet weak var emailTxtField: MainForm!
    @IBOutlet weak var usernameTxtField: MainForm!
    
    @IBAction func passwordResetTokenRequest(_ sender: Any)
    {
        guard let email = emailTxtField.text , emailTxtField.text != "" else { return }
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        
        PasswordResetInteractor().resetPassword(email: email, username: username, success: { (accepted) in
            
            guard let passwordResetFinalAction = self.storyboard?.instantiateViewController(
                withIdentifier: "PasswordResetFinalAction"
                ) as? PasswordResetFinalAction else { return }
            self.presentDetails(passwordResetFinalAction)
            
        }) { (rejected) in
            // TODO: Create a new alert for failure !
        }
        
//        AuthService.instance.resetPasswordToken(email: email, username: username)
//        {
//            (success) in
//
//            if (success) {
//                if AuthService.instance.allowedToResetPassword {
//                    self.performSegue(withIdentifier: "ForgotPasswordSegue", sender: self)
//                }
//            }
//        }
    }
    
    @IBAction func cancelPasswordReset(_ sender: Any)
    {
        dismissDetails()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let passwordResetFinalAction = segue.destination as? PasswordResetFinalAction {
            passwordResetFinalAction.token = PasswordResetInteractor().passwordResetToken
        }
    }
}
