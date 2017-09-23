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
    @IBOutlet weak var meetupsLbl: UILabel!
    @IBOutlet weak var planningCollection: UICollectionView!
    @IBOutlet weak var meetupsTable: UITableView!
    
    @IBAction func createMeetup(_ sender: Any)
    {
        guard let createMeetupController = storyboard?.instantiateViewController(
            withIdentifier: "createMeetupController"
            ) as? CreateMeetupController else { return }
        presentDetails(createMeetupController)
    }
}

extension PlanningController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = meetupsTable.dequeueReusableCell(withIdentifier: "meetupCell") as? MeetupCell else { return UITableViewCell() }
        cell.configureCell(client: "Mr Test", time: "Today !")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let billDetailController = storyboard?.instantiateViewController(
            withIdentifier: "BillsDetailsController"
            ) as? BillsDetailsController else { return }
        present(billDetailController, animated: true, completion: nil)
    }
}
