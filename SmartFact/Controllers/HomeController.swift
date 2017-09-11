//
//  HomeController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 02/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class HomeController: UIViewController
{
    @IBOutlet weak var usernameTxtLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        DataService.instance.getPersonalUserInformations {
            (success) in
            if success {
                self.usernameTxtLabel.text = "Hello \(UserMock.instance.username)"
            }
        }
    }
    
    @IBAction func logoutUser(_ sender: Any)
    {
        AuthService.instance.isLoggedIn = false
        self.performSegue(withIdentifier: "LogoutUserSegue", sender: self)
    }
}
