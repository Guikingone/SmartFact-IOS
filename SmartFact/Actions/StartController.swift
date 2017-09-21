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
        guard let loginController = storyboard?.instantiateViewController(
            withIdentifier: "loginController"
            ) as? LoginController else { return }
        
        presentDetails(loginController)
    }
    
    @IBAction func register(_ sender: Any)
    {
        guard let registerController = storyboard?.instantiateViewController(
            withIdentifier: "registerController"
            ) as? RegisterController else { return }
        
        presentDetails(registerController)
    }
}
