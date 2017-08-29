//
//  DataService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation
import Alamofire
import CoreData

class DataService
{
    static let instance = DataService()
    
    var users: [User] = []
    
    func getPersonalUserInformations(completionHandler: @escaping CompletionHandler)
    {
        Alamofire.request(URI_PERSONAl_USER, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    
                    // Allow to search if the user already exist in Core Data.
                    guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                    do {
                        self.users = try managedContext.fetch(fetchRequest) as! [User]
                        for user in self.users {
                            if user.email == json["email"] as? String {
                                print("User already found !")
                                return
                            } else {
                                let user = User(context: managedContext)
                                user.id = json["id"] as? String
                                user.firstname = json["firstname"] as? String
                                user.lastname = json["lastname"] as? String
                                user.email = json["email"] as? String
                                user.username = json["username"] as? String
                                do {
                                    try managedContext.save()
                                    completionHandler(true)
                                } catch {
                                    debugPrint("Error : \(error.localizedDescription)")
                                    completionHandler(false)
                                }
                            }
                        }
                    } catch {
                        debugPrint(error)
                    }
                }
                completionHandler(true)
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
    
    func deletePersonalUser(completionHandler: @escaping CompletionHandler)
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        for user in self.users {
            managedContext.delete(user)
            completionHandler(true)
        }
    }
}
