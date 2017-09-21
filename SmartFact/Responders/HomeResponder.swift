//
//  HomeResponder.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 21/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class HomeResponder
{
    public func storeUserData(data: UserStruct.Response)
    {
        UserManager().createUser(data: data, success: { (success) in
            UserManager().getUser(data: data, completion: { (success) in
                
            })
        }) { (failure) in
            // TODO
        }
    }
}
