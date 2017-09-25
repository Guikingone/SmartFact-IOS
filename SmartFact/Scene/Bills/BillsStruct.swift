//
//  BillsStruct.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 25/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

struct BillStruct: Decodable
{
    struct getBillsData: Decodable
    {
        let id: String
        let date: String
        let total: Double
        let send: Bool?
        let createdAt: String
        let sendAt: String?
        let file: String?
        let tva: Bool
    }
}
