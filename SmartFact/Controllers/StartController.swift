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
    @IBAction func unwindFromLoginController(unwindSegue: UIStoryboardSegue){}
    @IBAction func unwindFromRegisterController(unwindSegue: UIStoryboardSegue){}
}
