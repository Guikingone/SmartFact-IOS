//
//  MeetupsDetailsController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 04/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class MeetupsDetailsController: UIViewController
{
    @IBOutlet weak var meetupResumeTxtField: UILabel!
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetails()
    }
}
