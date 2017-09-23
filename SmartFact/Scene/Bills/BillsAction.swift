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
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        BillsInteractor().fetchBills(success: { (found) in
            self.bills = found
        }) { (missing) in
            self.billsList.isHidden = true
            self.welcomeLabel.isHidden = false
        }
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        
        print(self.bills)
        if self.bills.count >= 1 {
            self.billsList.isHidden = false
        }
        
        billsList.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        billsList.delegate = self
        billsList.dataSource = self
        billsList.isHidden = true
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
        present(billDetailController, animated: true, completion: nil)
    }
}
