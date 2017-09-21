//
//  AccountingManager.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 08/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class AccountingManager
{
    static let instance = AccountingManager()
    
    public func createAccounting(data: Dictionary<String, Any>)
    {
        AccountingMock.instance.create()
    }
}
