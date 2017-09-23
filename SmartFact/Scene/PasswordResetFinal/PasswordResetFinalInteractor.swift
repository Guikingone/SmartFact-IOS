//
//  PasswordResetFinalInteractor.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class PasswordResetFinalInteractor
{
    public func resetPasswordFinal(password: String, token: String, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        PasswordResetFinalWorker().resetPasswordFinal(token: token, password: password, success: { (resetted) in
            success(true)
        }) { (failed) in
            failure(true)
        }
    }
}
