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
    
    public func getPersonalBills(success: @escaping (_: Bool) -> ())
    {
        Alamofire.request(URI_PERSONAL_BILLS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    BillsManager.instance.setBillsData(data: json)
                    success(true)
                }
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    public func getPersonalAccounting(success: @escaping (_: Bool) -> ())
    {
        Alamofire.request(URI_PERSONAL_ACCOUNTINGS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    AccountingManager.instance.createAccounting(data: json)
                    success(true)
                }
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getPersonalClients(success: @escaping (_: Bool) -> ())
    {
        Alamofire.request(URI_PERSONAL_CLIENTS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    ClientsManager.instance.create(data: json)
                    success(true)
                }
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
    func getPersonalPlanning(success: @escaping (_: Bool) -> ())
    {
        Alamofire.request(URI_PERSONAL_PLANNING, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    PlanningManager.instance.create(data: json)
                    success(true)
                }
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func getPersonalMeetups(success: @escaping (_: Bool) -> ())
    {
        Alamofire.request(URI_PERSONAL_MEETUPS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    MeetupsManager.instance.create(data: json)
                    success(true)
                }
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
        
    }
    
    func getPersonalNotifications(success: @escaping (_: Bool) -> ())
    {
        Alamofire.request(URI_PERSONAL_NOTIFICATIONS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: AUTH_HEADERS).responseJSON { (response) in
            
            if response.result.error == nil {
                if let json = response.result.value as? Dictionary<String, Any> {
                    NotificationsManager.instance.createNotifications(data: json)
                    success(true)
                }
            } else {
                success(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
}
