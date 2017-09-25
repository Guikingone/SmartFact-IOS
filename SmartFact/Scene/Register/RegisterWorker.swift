//
//  RegisterWorker.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 25/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class RegisterWorker
{
    public func registerUser(username: String, plainPassword: String, email: String, succes: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        do {
            
            let body = [
                "username": username,
                "plainPassword": plainPassword,
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
                
                DispatchQueue.main.async {
                    guard let response = response as? HTTPURLResponse, response.statusCode == 201 else { return }
                    
                    if response.statusCode == 201 {
                        DispatchQueue.main.async {
                            succes(true)
                        }
                    } else {
                        failure(true)
                    }
                }
            }
            
            task.resume()
            
        } catch {
            debugPrint("Could not create a new account: \(error.localizedDescription)")
            failure(true)
        }
    }
}
