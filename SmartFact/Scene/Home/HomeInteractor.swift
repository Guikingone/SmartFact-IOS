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
}
