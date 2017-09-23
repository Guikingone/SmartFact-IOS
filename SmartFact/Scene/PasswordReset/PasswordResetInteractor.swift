//
//  PasswordResetInteractor.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class PasswordResetInteractor
{
    let defaults = UserDefaults.standard
    
    var passwordResetToken: String
    {
        get {
            return defaults.string(forKey: PASSWORD_RESET_TOKEN)!
        }
        set {
            defaults.set(newValue, forKey: PASSWORD_RESET_TOKEN)
        }
    }
    
    var allowedToResetPassword: Bool
    {
        get {
            return defaults.bool(forKey: ALLOWED_RESET_TOKEN)
        }
        set {
            defaults.set(newValue, forKey: ALLOWED_RESET_TOKEN)
        }
    }
    
    public func resetPassword(email: String, username: String, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        PasswordResetWorker().resetPasswordToken(email: email, username: username, success: { (resetToken) in
            self.passwordResetToken = resetToken.token
            self.allowedToResetPassword = true
        }) { (requestError) in
            failure(true)
        }
    }
}
