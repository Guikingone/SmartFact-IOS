//
//  BillsController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit
import CoreData

class BillsController: UIViewController
{
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var billsList: UITableView!
    
    var bills: [BillsMock] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        billsList.delegate = self
        billsList.dataSource = self
        
        // TODO : Check if there's data, if not, show the label.
        //        If so, show the table then load data from API (or CoreData if
        //        the option was checked).
        
        billsList.isHidden = false
        
//        DataService.instance.getPersonalBills { (success) in
//            if success {
//                // TODO : Display all the bills saved.
//                fetch(entityname: "Bills", completion: { (success) in
//                    if success {
//
//                    }
//                })
//            }
//        }
    }
    
    @IBAction func createBillAction(_ sender: Any)
    {
        guard let createBillController = storyboard?.instantiateViewController(withIdentifier: "createBillController") else { return }
        presentDetails(createBillController)
    }
}

extension BillsController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = billsList.dequeueReusableCell(withIdentifier: "billCell") as? BillsCell
            else { return UITableViewCell() }
        cell.configureCell(client: "Mr Test", total: 12.5)
        return cell
    }
}
