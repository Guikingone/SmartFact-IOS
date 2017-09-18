//
//  UserMock.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 29/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class UserMock: Decodable
{
    static let instance = UserMock()
    
    public private(set) var id: String = ""
    public private(set) var username: String = ""
    public private(set) var firstname: String = ""
    public private(set) var lastname: String = ""
    public private(set) var email: String = ""
    
    func createUser(id: String, username: String, firstname: String, lastname: String, email: String)
    {
        self.id = id
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
    }
    
    func patchUser()
    {
        
    }
}
