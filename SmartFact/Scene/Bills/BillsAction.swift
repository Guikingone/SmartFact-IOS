//
//  BillsController.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class BillsAction: UIViewController
{
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var billsList: UITableView!
    
    var bills: [BillStruct.getBillsData] = []

    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if self.bills.count >= 1 {
            self.billsList.isHidden = false
        } else {
            self.billsList.isHidden = true
        }
        
        billsList.reloadData()
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        BillsInteractor().fetchBills(success: { (found) in
            self.bills = found
            // TODO: Fetch CoreData via the BillsManager in order to find the bills.
        }) { (missing) in
            self.billsList.isHidden = true
            self.welcomeLabel.isHidden = false
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        billsList.delegate = self
        billsList.dataSource = self
        billsList.isHidden = true
        welcomeLabel.isHidden = false
    }
    
    @IBAction func createBillAction(_ sender: Any)
    {
        guard let createBillController = storyboard?.instantiateViewController(withIdentifier: "createBillController") else { return }
        presentDetails(createBillController)
    }
}

extension BillsAction: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = billsList.dequeueReusableCell(withIdentifier: "BillCell") as? BillsCell else { return UITableViewCell() }
        let bill = bills[indexPath.row]
        cell.configureCell(client: bill.date, total: bill.total)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let billDetailController = storyboard?.instantiateViewController(
            withIdentifier: "BillsDetailsController"
            ) as? BillsDetailsController else { return }
        presentDetails(billDetailController)
    }
}
