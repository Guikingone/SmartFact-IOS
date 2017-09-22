//
//  BillWorker.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 22/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class BillsWorker
{
    public func getPersonalBills(success: @escaping (_: BillStruct.viewData) -> (), failure: @escaping (_: Bool) -> ())
    {
        do {
            let request = try URLRequest(url: URI_PERSONAL_BILLS, method: .get, headers: AUTH_HEADERS)
            
            let task = URLSession.shared.dataTask(with: request)
            { (data, response, errors) in
                
                if errors != nil {
                    failure(true)
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                
                let data = data!
                
                if response.statusCode == 200 {
                    DispatchQueue.main.async {
                        let bills = try? JSONDecoder().decode(BillStruct.viewData.self, from: data)
                        success(bills!)
                    }
                } else {
                    failure(true)
                }
            }
            
            task.resume()
            
        } catch {
            debugPrint(error)
            failure(true)
        }
    }
}
