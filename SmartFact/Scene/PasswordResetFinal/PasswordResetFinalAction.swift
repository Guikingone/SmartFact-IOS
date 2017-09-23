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
            // TODO
        }) { (failed) in
            // TODO
        }
    }
}
