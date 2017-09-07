//
//  DataService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Alamofire
import Foundation

class DataService
{
    static let instance = DataService()
    
    func getPersonalUserInformations(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAl_USER, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    let id = json["id"] as! String
                    let username = json["username"] as! String
                    let email = json["email"] as! String
                    let firstname = json["firstname"] as! String
                    let lastname = json["lastname"] as! String
                    
                    // Store the data received from the API into the UserService.
                    UserService.instance.setUserData(
                        id: id,
                        username: username,
                        firstname: firstname,
                        lastname: lastname,
                        email: email
                    )
                    completionHandler(true)
                }
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getPersonalBills(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAL_BILLS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    // TODO
                }
                completionHandler(true)
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
                    // TODO
                }
                completionHandler(true)
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
                    // TODO
                }
                completionHandler(true)
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
                    // TODO
                }
                completionHandler(true)
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
                    // TODO
                }
                completionHandler(true)
            } else {
                completionHandler(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
