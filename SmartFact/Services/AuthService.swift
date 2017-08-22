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
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String
    {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(username: String, email: String, password: String, completion: @escaping CompletionHandler)
    {
        let body: [String: Any] = [
            "username": username,
            "password": password,
            "email": email
        ]
        
        Alamofire.request("\(URI_DEV)/api/users/register", method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                print(response.result.value as Any?)
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
        
        Alamofire.request("\(URI_DEV)/jwt/token", method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON {
            (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    if let token = json["token"] as? String {
                        self.authToken = token
                        self.isLoggedIn = true
                    }
                }
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
