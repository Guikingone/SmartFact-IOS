//
//  Constants.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

// URL Security constants
let URI_PROD: String = "http://smartfact.guillaumeloulier.fr/"
let URI_DEV: String = "http://127.0.0.1:8000/"
let URI_REGISTER: String = "\(URI_DEV)register/api"
let URI_LOGIN: String = "\(URI_DEV)jwt/token"
let URI_RESET_PASSWORD_TOKEN: String = "\(URI_DEV)password/reset/token/api"
let URI_RESET_PASSWORD: String = "\(URI_DEV)password/reset/api"

// URL Users constants
let URI_PERSONAL_USER: String = "\(URI_DEV)api/users/me"
let URI_PERSONAL_NOTIFICATIONS: String = "\(URI_DEV)api/notifications/me"
let URI_PERSONAL_PLANNING: String = "\(URI_DEV)api/planning/me"
let URI_PERSONAL_MEETUPS: String = "\(URI_DEV)api/meetups/me"
let URI_PERSONAL_BILLS: String = "\(URI_DEV)api/bills/me"
let URI_PERSONAL_CLIENTS: String = "\(URI_DEV)api/clients/me"
let URI_PERSONAL_ACCOUNTINGS: String = "\(URI_DEV)api/accountings/me"

// User defaults
let TOKEN_KEY = "token"
let ALLOWED_RESET_TOKEN = "reset_password_token"
let PASSWORD_RESET_TOKEN = "reset_token"
let LOGGED_IN_KEY = "logged_in"
let USER_EMAIL = "user_email"
let LOGGED_IN = false

// Headers
let HEADERS = ["Content-Type": "application/json"]

let AUTH_HEADERS = [
    "Content-Type": "application/json",
    "authorization": LoginWorker.authToken
]
