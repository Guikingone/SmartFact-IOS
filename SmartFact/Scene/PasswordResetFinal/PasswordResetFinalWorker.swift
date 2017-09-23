//
//  PasswordResetFinalWorker.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 23/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class PasswordResetFinalWorker
{
    public func resetPasswordFinal(token: String, password: String, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        do {
            let body = [
                "token": token,
                "password": password
            ]
            
            let requestBody = try? JSONEncoder().encode(body)
            
            let request = try URLRequest(url: URI_RESET_PASSWORD, method: .post, headers: HEADERS)
            
            let task = URLSession.shared.uploadTask(with: request, from: requestBody, completionHandler: { (data, response, errors) in

                if errors != nil {
                    return
                }
                
                guard let response = response as? HTTPURLResponse , response.statusCode == 201 else { return }
                
                DispatchQueue.main.async {
                    if response.statusCode == 201 {
                        success(true)
                    } else {
                        failure(true)
                    }
                }
            })
            
            task.resume()
            
        } catch {
            debugPrint(error.localizedDescription)
            failure(true)
        }
    }
}
