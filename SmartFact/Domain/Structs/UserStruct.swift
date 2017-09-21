//
//  User.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 19/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

struct UserStruct: Decodable
{
    struct Response: Decodable
    {
        let id: String
        let username: String
        let firstname: String
        let lastname: String
        let email: String
    }
    
    let id: String
    let username: String
    let firstname: String
    let lastname: String
    let email: String
}
