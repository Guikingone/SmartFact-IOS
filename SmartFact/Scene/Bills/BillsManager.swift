//
//  BillsManager.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 22/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import CoreData

class BillsManager
{
    public func saveBills(data: [BillStruct.getBillsData], saved: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        for bill in data {
            let newBill = Bills(context: managedContext)
            // TODO : Call the different keys in order to save bills.
            newBill.tva = bill.tva
            newBill.total = bill.total
        }
        
        do {
            try managedContext.save()
            saved(true)
        } catch {
            debugPrint("Could not save : \(error.localizedDescription)")
            failure(true)
        }
    }
    
    public func fetchBills(fetched: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Bills")
        
        do {
            try managedContext.fetch(request)
            fetched(true)
        } catch {
            debugPrint("Could not fetch : \(error.localizedDescription)")
            failure(true)
        }
    }
    
    public func fetchSingleBills(id: String, fetched: @escaping(_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        
    }
}
