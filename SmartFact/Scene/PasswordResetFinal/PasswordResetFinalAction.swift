//
//  PasswordResetFinalAction.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class PasswordResetFinalAction: UIViewController
{
    @IBOutlet weak var passwordTxtField: MainForm!
    
    var token: String = ""
    
    @IBAction func resetPassword(_ sender: Any)
    {
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        
        PasswordResetFinalInteractor().resetPasswordFinal(password: password, token: token, success: { (succeed) in
            guard let loginAction = self.storyboard?.instantiateViewController(
                withIdentifier: "LoginAction"
                ) as? LoginAction else { return }
            self.presentDetails(loginAction)
        }) { (failed) in
            
            let resetError: String = "Something goes wrong !"
            let error: String = "To define"
            
            let resetAlert = UIAlertController(
                title: resetError,
                message: error,
                preferredStyle: .alert
            )
            
            resetAlert.addAction(
                UIAlertAction(
                    title: NSLocalizedString("I understand",
                    comment: "Default action"),
                    style: .`default`,
                    handler: { _ in }
                )
            )
            
            self.present(resetAlert, animated: true, completion: nil)
        }
    }
    @IBAction func cancelPasswordResetFinal(_ sender: Any)
    {
        dismissDetails()
    }
}
