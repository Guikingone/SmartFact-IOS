//
//  BillsManager.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 08/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class BillsManager
{
    static let instance = BillsManager()
    
    public private(set) var bills: [String: Any] = [:]
    
    public func setBillsData(data: Dictionary<String, Any>)
    {
        for entry in data {
            // TODO: Create a Mock and hydrate it in order to return data to Controller.
            let bills = BillsMock()
            
        }
    }
}
