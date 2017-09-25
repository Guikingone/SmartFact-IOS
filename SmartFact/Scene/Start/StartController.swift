//
//  StartController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class StartController: UIViewController
{
    @IBAction func login(_ sender: Any)
    {
        guard let loginAction = storyboard?.instantiateViewController(
            withIdentifier: "LoginAction"
            ) as? LoginAction else { return }
        
        presentDetails(loginAction)
    }
    
    @IBAction func register(_ sender: Any)
    {
        guard let registerAction = storyboard?.instantiateViewController(
            withIdentifier: "RegisterAction"
            ) as? RegisterAction else { return }
        
        presentDetails(registerAction)
    }
}
