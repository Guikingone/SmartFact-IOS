//
//  MeetupCell.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class MeetupCell: UITableViewCell
{
    @IBOutlet weak var meetupClientLbl: UILabel!
    @IBOutlet weak var meetupTimeLbl: UILabel!
    
    func configureCell(client: String, time: String)
    {
        meetupClientLbl.text = client
        meetupTimeLbl.text = time
    }
}

