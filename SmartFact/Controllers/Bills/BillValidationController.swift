//
//  BillValidationController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 18/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class BillValidationController: UIViewController
{
    var billsMock = BillsMock()
    
    public func initData(client: String, startingDate: String, endingDate: String)
    {
        
    }
    
    @IBAction func backBtnWasPressed (_ sender: Any)
    {
        dismissDetails()
    }
}
