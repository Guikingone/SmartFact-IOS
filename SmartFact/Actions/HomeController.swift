//
//  HomeController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 02/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class HomeAction: UIViewController
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
        
        DataWorker.instance.getPersonalUserInformations(success: { (success) in
            
            // TODO: Call the manager to store data and update the TxtField.
            
            HomeResponder().storeUserData(data: UserStruct)
            
            self.usernameTxtLabel.text = "Hello \(UserMock.instance.username)"
            
        }) { (failure) in
            self.usernameTxtLabel.text = ""
            self.connexionFailure()
        }
    }
    
    @IBAction func logoutUser(_ sender: Any)
    {
        logout()
    }
}
