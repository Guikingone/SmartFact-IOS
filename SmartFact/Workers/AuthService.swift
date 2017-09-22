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
    
    public func registerUser(username: String, email: String, password: String, completion: @escaping (_: Bool) -> ())
    {
        do {
            
            let body = [
                "username": username,
                "plainPassword": password,
                "email": email
            ]
            
            guard let requestBody = try? JSONEncoder().encode(body) else { return }
            
            let request = try URLRequest(url: URI_REGISTER, method: .post, headers: HEADERS)
            
            let task = URLSession.shared.uploadTask(with: request, from: requestBody) {
                (data, response, error) in
                
                if let error = error {
                    debugPrint(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 201 else { return }
                
                if response.statusCode == 201 {
                    completion(true)
                }
            }
            
            task.resume()
            
        } catch {
            debugPrint(error)
            completion(false)
        }
    }
    
    public func loginUser(username: String, password: String, completion: @escaping (_: Bool) -> ())
    {
        do {
            let body = [
                "username": username,
                "password": password
            ]
            
            guard let requestBody = try? JSONEncoder().encode(body) else { return }
            
            let request = try URLRequest(url: URI_LOGIN, method: .post, headers: HEADERS)
            
            let task = URLSession.shared.uploadTask(with: request, from: requestBody) {
                (data, response, error) in
                
                if let error = error {
                    print(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                
                if response.statusCode == 200 {
                    let userToken = try? JSONDecoder().decode(UserStruct.authToken.self, from: data!)
                    self.authToken = (userToken?.token)!
                    self.isLoggedIn = true
                    completion(true)
                }
            }
            
            task.resume()
            
        } catch {
            debugPrint(error)
            completion(false)
        }
    }
    
    func resetPasswordToken(email: String, username: String, success: @escaping (_: Bool) -> ())
    {
        let body = [
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
                success(true)
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func resetPassword(password: String, success: @escaping (_: Bool) -> ())
    {
        let body: [String: Any] = [
            "token": self.passwordResetToken,
            "password": password
        ]
        
        Alamofire.request(URI_RESET_PASSWORD, method: .patch, parameters: body, encoding: JSONEncoding.default, headers: HEADERS).responseJSON {
            (response) in
            
            if response.result.error == nil {
                success(true)
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
