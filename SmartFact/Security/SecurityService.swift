//
//  SecurityService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 25/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class SecurityService
{
    static let instance = SecurityService()

    let defaults = UserDefaults.standard
    
    var isLoggedIn: Bool
    {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String
    {
        get {
            return defaults.string(forKey: TOKEN_KEY)!
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
}
