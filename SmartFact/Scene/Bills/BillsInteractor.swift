//
//  BillsInteractor.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 22/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class BillsInteractor
{
    public func fetchBills(success: @escaping (_: [BillStruct.getBillsData]) -> (), failure: @escaping (_: Bool) -> ())
    {
        BillsWorker().getPersonalBills(success: { (data) in
            success(data)
        }) { (missing) in
            failure(true)
        }
    }
    
    public func fetchAndSaveBills(bills: [BillStruct.getBillsData], success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        BillsManager().saveBills(data: bills, saved: { (saved) in
            // TODO
        }) { (failed) in
            // TODO
        }
    }
}
