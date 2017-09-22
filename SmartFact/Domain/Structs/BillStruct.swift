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
    
    struct viewData: Decodable
    {
        let id: String
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
