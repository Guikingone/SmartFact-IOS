//
//  DataService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 15/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation
import Alamofire

class DataService
{
    static let instance = DataService()
    
    static let authService = AuthService.instance
    
    func getPersonalUserInformations()
    {
        if AuthService.instance.isLoggedIn {
            let headers: [String: Any] = [
                "Content-Type": "application/json",
                "Authorization": AuthService.instance.authToken
            ]
            
            // TODO
        }
    }
    
    func getPersonalBills()
    {
        
    }
    
    func getPersonalClients()
    {
        
    }
    
    func getPersonalPlanning()
    {
        
    }
    
    func getPersonalMeetups()
    {
        
    }
    
    func getPersonalNotifications()
    {
        
    }
}
