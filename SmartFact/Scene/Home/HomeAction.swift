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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.usernameTxtLabel.isHidden = true
    }
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        HomeInteractor().fetchUser(user: { (data) in
            self.usernameTxtLabel.text = data.username
            self.usernameTxtLabel.isHidden = false
        }) { (failure) in
            self.connexionFailure()
        }
    }
    
    @IBAction func logoutUser(_ sender: Any)
    {
        logout()
    }
}
