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
    
    func configureCell(client: String, total: Double)
    {
        billClientLbl.text = client
        billTotalLbl.text = String(describing: total)
    }
}
