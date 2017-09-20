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
    
    override func viewWillAppear(_ animated: Bool)
    {
        self.usernameTxtLabel.isHidden = false
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.usernameTxtLabel.isHidden = true
        
        DataService.instance.getPersonalUserInformations
        { (success) in
            
            DispatchQueue.main.async {
                if success {
                    self.usernameTxtLabel.text = "Hello \(UserMock.instance.username)"
                }
            }
        }
    }
    
    @IBAction func logoutUser(_ sender: Any)
    {
        logout()
    }
}
