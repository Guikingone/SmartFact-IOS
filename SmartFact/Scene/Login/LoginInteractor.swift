//
//  LoginInteractor.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 25/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class LoginInteractor
{
    public func login(username: String, password: String, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        LoginWorker().loginUser(username: username, password: password, success: { (logged) in
            success(true)
        }) { (failed) in
            failure(true)
        }
    }
}
