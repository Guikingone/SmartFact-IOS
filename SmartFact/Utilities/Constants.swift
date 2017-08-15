//
//  Constants.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URL constants
let URI_PROD: String = "http://smartfact.guillaumeloulier.fr"
let URI_DEV: String = "http://localhost:8000"

// User defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "logged_in"
let USER_EMAIL = "user_email"
