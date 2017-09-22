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
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        BillsInteractor().fetchBills(success: { (found) in
            // TODO
        }) { (missing) in
            // TODO
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        billsList.delegate = self
        billsList.dataSource = self
        
        // TODO : Check if there's data, if not, show the label.
        //        If so, show the table then load data from API (or CoreData if
        //        the option was checked).
        
        if BillsManager.instance.bills.count == 0 {
            self.billsList.isHidden = true
            self.welcomeLabel.isHidden = false
        }
        
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

extension BillsAction: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return BillsManager.instance.bills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = billsList.dequeueReusableCell(withIdentifier: "billCell") as? BillsCell
            else { return UITableViewCell() }
        cell.configureCell(client: "Mr Test", total: 12.5)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let billDetailController = storyboard?.instantiateViewController(
            withIdentifier: "BillsDetailsController"
            ) as? BillsDetailsController else { return }
        present(billDetailController, animated: true, completion: nil)
    }
}
