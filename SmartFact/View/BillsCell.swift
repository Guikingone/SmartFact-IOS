//
//  BillsCell.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 09/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class BillsCell: UITableViewCell
{
    @IBOutlet weak var billClientLbl: UILabel!
    @IBOutlet weak var billTotalLbl: UILabel!
    @IBOutlet weak var billDetailsBtn: UIButton!
    
    func configureCell(client: String, total: Double)
    {
        self.billClientLbl.text = client
        self.billTotalLbl.text = String(describing: total)
    }
    
    @IBAction func seeBillDetails(_ sender: Any)
    {
        // TODO : Return to the bills details page.
    }
}
