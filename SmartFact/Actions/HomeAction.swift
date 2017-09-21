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
        
        DataWorker.instance.getPersonalUserInformations(success: {
            (data) in
            
            // TODO: Call the manager to store data and update the TxtField.
            HomeResponder().getUserData(data: data, success: { (found) in
                
                if found {
                    self.usernameTxtLabel.text = data.username
                }
                
            }, failure: { (failure) in
                
                if failure {
                    HomeResponder().storeUserData(data: data, success: { (created) in
                        
                        if created {
                            // TODO : Return the user and set the username.
                        }
                        
                    }, failure: { (failure) in
                        
                        if failure {
                            // TODO: Show an error.
                        }
                    })
                }
            })
        }) { (failure) in
            // If the user isn't connected.
            self.connexionFailure()
        }
    }
    
    @IBAction func logoutUser(_ sender: Any)
    {
        logout()
    }
}
