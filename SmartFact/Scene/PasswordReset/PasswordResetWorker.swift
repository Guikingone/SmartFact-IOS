//
//  PasswordResetWorker.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class PasswordResetWorker
{
    public func resetPasswordToken(email: String, username: String, success: @escaping (_: PasswordResetStruct) -> (), failure: @escaping (_: Bool) -> ())
    {
        do {
            let body = [
                "email": email,
                "username": username
            ]
            
            guard let bodyRequest = try? JSONEncoder().encode(body) else { return }
            
            let request = try URLRequest(url: URI_RESET_PASSWORD_TOKEN, method: .post, headers: HEADERS)
            
            let task = URLSession.shared.uploadTask(with: request, from: bodyRequest, completionHandler: { (data, response, errors) in
                if errors != nil {
                    return
                }
                
                guard let response = response as? HTTPURLResponse , response.statusCode == 200 else { return }
    
                if response.statusCode == 200 {
                    let token = try? JSONDecoder().decode(PasswordResetStruct.self, from: data!)
                    success(token!)
                }
            })
            
            task.resume()
        
        } catch {
            debugPrint()
            failure(true)
        }
    }
}
