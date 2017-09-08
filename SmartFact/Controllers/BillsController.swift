//
//  BillsController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class BillsController: UIViewController
{
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var billsList: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        DataService.instance.getPersonalBills { (success) in
            if success {
                // TODO : Display all the bills saved.
            }
        }
    }
}
