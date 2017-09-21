//
//  HomeResponder.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 21/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class HomeResponder
{
    public func getUserData(data: UserStruct.Response, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        // TODO: Call CoreData and get the user using his username.
        UserManager().getUser(data: data) { (success) in
            
            if success {
                // TODO : Return the data.
            }
        }
    }
    
    public func storeUserData(data: UserStruct.Response, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        UserManager().createUser(data: data, success: { (success) in
            // TODO
        }) { (failure) in
            // TODO
        }
    }
}
