//
//  DataService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Alamofire
import Foundation

class DataWorker
{
    static let instance = DataWorker()
    
    public func getPersonalUserInformations(success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        do {
            let request = try URLRequest(url: URI_PERSONAL_USER, method: .get, headers: AUTH_HEADERS)
            
            let task = URLSession.shared.dataTask(with: request)
            { (data, response, errors) in
                
                if errors != nil {
                    failure(true)
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
                
                let data = data!
                
                if response.statusCode == 200 {
                    let user = try? JSONDecoder().decode(UserStruct.self, from: data)
                    
                    UserStruct.init(
                        id: (user?.id)!,
                        username: (user?.username)!,
                        firstname: (user?.firstname)!,
                        lastname: (user?.lastname)!,
                        email: (user?.email)!
                    )
                    
                    success(true)
                }
            }
            
            task.resume()
            
        } catch {
            debugPrint(error)
        }
    }
    
    public func getPersonalBills(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_BILLS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    BillsManager.instance.setBillsData(data: json)
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    public func getPersonalAccounting(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_ACCOUNTINGS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    AccountingManager.instance.createAccounting(data: json)
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getPersonalClients(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_CLIENTS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    ClientsManager.instance.create(data: json)
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getPersonalPlanning(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_PLANNING, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    PlanningManager.instance.create(data: json)
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func getPersonalMeetups(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_MEETUPS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    MeetupsManager.instance.create(data: json)
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func getPersonalNotifications(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_NOTIFICATIONS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    NotificationsManager.instance.createNotifications(data: json)
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
