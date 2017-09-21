//
//  PlanningController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class PlanningController: UIViewController
{
    @IBAction func createMeetup(_ sender: Any)
    {
        guard let createMeetupController = storyboard?.instantiateViewController(
            withIdentifier: "createMeetupController"
            ) as? CreateMeetupController else { return }
        presentDetails(createMeetupController)
    }
}
