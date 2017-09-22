//
//  User.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 19/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

struct UserStruct: Decodable
{
    struct getUserData: Decodable
    {
        let id: String
        let username: String
        let firstname: String
        let lastname: String
        let email: String
    }
    
    struct postUserData: Decodable
    {
        let id: String
        let username: String
        let firstname: String
        let lastname: String
        let email: String
    }
    
    struct viewUserData: Decodable
    {
        let id: String
        let username: String
        let firstname: String
        let lastname: String
        let email: String
    }
    
    struct authToken: Decodable
    {
        let token: String
    }
    
    struct passwordReset: Decodable
    {
        let token: String
    }
    
    let id: String
    let username: String
    let firstname: String
    let lastname: String
    let email: String
}
