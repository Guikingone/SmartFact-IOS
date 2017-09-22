//
//  HomInteractor.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 22/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class HomeInteractor
{
    public func fetchUser(user: @escaping (_: UserStruct.viewUserData) -> (), failure: @escaping (_: Bool) -> ())
    {
        HomeWorker().getPersonalUserInformations(success: { (found) in
            user(found)
        }) { (missing) in
            failure(true)
        }
    }
    
    public func fetchAndSaveUser(happy: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        HomeWorker().getPersonalUserInformations(success: { (found) in
            let data = UserStruct.postUserData.init(id: found.id, username: found.username, firstname: found.firstname, lastname: found.lastname, email: found.email)
            
            HomeManager().saveUser(data: data, success: { (saved) in
                happy(true)
            }, failure: { (failed) in
                failure(true)
            })
        }) { (missing) in
            failure(true)
        }
    }
}
