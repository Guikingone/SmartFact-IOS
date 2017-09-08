//
//  BillsMock.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 08/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class BillsMock
{
    static let instance = BillsMock()
    
    public private(set) var id: String = ""
    public private(set) var date: String = ""
    public private(set) var total: Double = 0.0
    public private(set) var send: Bool = false
    public private(set) var createdAt: String = ""
    public private(set) var sendAt: String = ""
    public private(set) var tva: Bool = false
    
    func createBills(id: String, date: String, total: Double)
    {
        
    }
}
