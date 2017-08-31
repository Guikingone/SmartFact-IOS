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
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var usernameLbl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        DataService.instance.getPersonalUserInformations { (success) in
            
            if success {
                // TODO
                // Change the username displayed
            }
        }
    }
    
    @IBAction func logoutUser(_ sender: Any)
    {
        AuthService.instance.isLoggedIn = false
        DataService.instance.deletePersonalUser { (success) in
            
            if success {
                print("User deleted !")
            }
        }
        self.performSegue(withIdentifier: "LogoutUserSegue", sender: self)
    }
}
