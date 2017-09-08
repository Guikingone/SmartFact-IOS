//
//  UserController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 04/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class UserController: UIViewController
{
    @IBOutlet weak var usernameTxtLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTxtLabel.text = UserMock.instance.username
    }
}
