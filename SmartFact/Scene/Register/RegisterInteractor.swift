//
//  RegisterInteractor.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 25/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class RegisterInteractor
{
    public func register(username: String, plainPassword: String, email: String, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        RegisterWorker().registerUser(username: username, plainPassword: plainPassword, email: email, succes: { (registrered) in
            success(true)
        }) { (failed) in
            failure(true)
        }
    }
}
