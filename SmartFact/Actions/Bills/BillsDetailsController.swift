//
//  BillsDetailsController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 04/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class BillsDetailsController: UIViewController
{
    @IBOutlet weak var billClientNameLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetails()
    }
}
