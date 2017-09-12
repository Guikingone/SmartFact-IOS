//
//  CreateBillController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 11/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class CreateBillController: UIViewController
{
    @IBOutlet weak var clientTxtField: UITextField!
    @IBOutlet weak var clientPicker: UIPickerView!
    @IBOutlet weak var createBillBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createBillBtn.bindToKeyboard()
        clientPicker.isHidden = true
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetails()
    }
    
    @IBAction func createBillBtn(_ sender: Any)
    {
        
    }
}
