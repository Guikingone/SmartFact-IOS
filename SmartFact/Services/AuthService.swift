//
//  AuthService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation
import Alamofire

class AuthService
{
    static let instance = AuthService()
    
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
    
    var allowedToResetPassword: Bool
    {
        get {
            return defaults.bool(forKey: ALLOWED_RESET_TOKEN)
        }
        set {
            defaults.set(newValue, forKey: ALLOWED_RESET_TOKEN)
        }
    }
    
    var passwordResetToken: String
    {
        get {
            return defaults.string(forKey: PASSWORD_RESET_TOKEN)!
        }
        set {
            defaults.set(newValue, forKey: PASSWORD_RESET_TOKEN)
        }
    }
    
    var userEmail: String
    {
        get {
            return defaults.string(forKey: USER_EMAIL)!
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(username: String, email: String, password: String, completion: @escaping CompletionHandler)
    {
        let body: [String: Any] = [
            "username": username,
            "plainPassword": password,
            "email": email
        ]
        
        Alamofire.request(URI_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func loginUser(username: String, password: String, completion: @escaping CompletionHandler)
    {
        let body: [String: Any] = [
            "username": username,
            "password": password
        ]
        
        Alamofire.request(URI_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON {
            (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let token = json["token"] as? String {
                        self.authToken = token
                        self.isLoggedIn = true
                        completion(true)
                    }
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func resetPasswordToken(email: String, username: String, completion: @escaping CompletionHandler)
    {
        let body: [String: Any] = [
            "email": email,
            "username": username
        ]
        
        Alamofire.request(URI_RESET_PASSWORD_TOKEN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON {
            (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let token = json["token"] as? String {
                        self.passwordResetToken = token
                        self.allowedToResetPassword = true
                    }
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func resetPassword(password: String, completion: @escaping CompletionHandler)
    {
        let body: [String: Any] = [
            "token": self.passwordResetToken,
            "password": password
        ]
        
        Alamofire.request(URI_RESET_PASSWORD, method: .patch, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON {
            (response) in
            
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
