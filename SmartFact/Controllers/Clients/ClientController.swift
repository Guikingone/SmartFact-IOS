//
//  ClientController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class ClientController: UIViewController
{
    @IBOutlet weak var clientNameTxtField: UILabel!
    
    @IBAction func backBtnPressed(_ sender: Any)
    {
        dismissDetails()
    }
}
