//
//  LoginWorker.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 25/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class LoginWorker
{
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
    
    var userEmail: String
    {
        get {
            return defaults.string(forKey: USER_EMAIL)!
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    public func loginUser(username: String, password: String, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
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
                
                DispatchQueue.main.async {
                    if response.statusCode == 200 {
                        let userToken = try? JSONDecoder().decode(UserStruct.authToken.self, from: data!)
                        self.authToken = (userToken?.token)!
                        LOGGED_IN = true
                        success(true)
                    } else {
                        failure(true)
                    }
                }
            }
            
            task.resume()
            
        } catch {
            debugPrint("Could not log the user : \(error.localizedDescription)")
            failure(false)
        }
    }
}
