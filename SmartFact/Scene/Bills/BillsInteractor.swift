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
    public func fetchBills(success: @escaping (_: BillStruct.viewData) -> (), failure: @escaping (_: Bool) -> ())
    {
        BillsWorker().getPersonalBills(success: { (data) in
            success(data)
        }) { (missing) in
            failure(true)
        }
    }
}
