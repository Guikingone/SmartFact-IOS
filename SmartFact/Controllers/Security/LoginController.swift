//
//  LoginController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginController: UIViewController
{
    @IBOutlet weak var usernameTxtField: MainForm!
    @IBOutlet weak var passwordTxtField: MainForm!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Adding the TouchID feature for authentication.
        if LABiometryType.typeTouchID.rawValue == 1 {
            
        }
    }
    
    @IBAction func unwindFromReinitialisationController(unwindSegue: UIStoryboardSegue){}
    
    @IBAction func LoginUser(_ sender: Any)
    {
        guard let username = usernameTxtField.text , usernameTxtField.text != "" else { return }
        guard let password = passwordTxtField.text , passwordTxtField.text != "" else { return }
        
        AuthService.instance.loginUser(username: username, password: password)
        { (success) in
            if (success) {
                if AuthService.instance.isLoggedIn {
                    self.performSegue(withIdentifier: "LoggedInSegue", sender: self)
                }
            }
        }
    }
}
