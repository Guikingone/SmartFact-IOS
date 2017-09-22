//
//  BillStruct.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 20/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

struct BillStruct
{
    let id: String
    
    struct getBillsData: Decodable
    {
        let id: String
        let date: String
        let total: Double
        let send: Bool
        let createdAt: String
        let sendAt: String
        let file: String
        let tva: Bool
    }
    
    struct Request: Decodable
    {
        let id: String
    }
    
    struct View: Decodable
    {
        let id: String
    }
}
