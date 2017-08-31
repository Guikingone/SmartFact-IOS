//
//  DataService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import CoreData
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
                    
                    // Allow to search if the user already exist in Core Data.
                    do {
                        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
                        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                        let users = try managedContext.fetch(fetchRequest) as! [User]
                        for user in users {
                            if user.email == json["email"] as? String {
                                let personalUser = user
                                print(personalUser)
                            }
                        }
//                        for user in self.users {
//                            if user.email == json["email"] as? String {
//                                print("User already found !")
//                                return
//                            } else {
//                                let user = User(context: managedContext)
//                                user.id = json["id"] as? String
//                                user.firstname = json["firstname"] as? String
//                                user.lastname = json["lastname"] as? String
//                                user.email = json["email"] as? String
//                                user.username = json["username"] as? String
//                                do {
//                                    try managedContext.save()
//                                    completionHandler(true)
//                                } catch {
//                                    debugPrint("Error : \(error.localizedDescription)")
//                                    completionHandler(false)
//                                }
//                            }
//                        }
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
                    // Allow to search if new bills can be added in Core Data.
                    do {
                        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
                        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Bills")
                        let bills = try managedContext.fetch(fetchRequest) as! [Bills]
                        for bill in bills {
                            // TODO: Found if there's no new bills.
                            
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
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        // TODO : Add a predicate on the username or email.
        
        do {
            let user = try managedContext.fetch(fetchRequest)
            managedContext.delete(user as! NSManagedObject)
        } catch {
            debugPrint(error)
        }
    }
}
