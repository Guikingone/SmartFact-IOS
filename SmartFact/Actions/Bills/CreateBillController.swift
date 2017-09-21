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
    @IBOutlet weak var startingDateTxtField: UITextField!
    @IBOutlet weak var endingDateTxtField: UITextField!
    @IBOutlet weak var createBillBtn: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        createBillBtn.bindToKeyboard()
    }
    
    @IBAction func createBillBtn(_ sender: Any)
    {
        guard let billValidationController = storyboard?.instantiateViewController(withIdentifier: "billValidationController") as? BillValidationController else { return }
        
        billValidationController.initData(
            client: clientTxtField.text!,
            startingDate: startingDateTxtField.text!,
            endingDate: endingDateTxtField.text!
        )
        
        presentDetails(billValidationController)
        
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any)
    {
        dismissDetails()
    }
}
