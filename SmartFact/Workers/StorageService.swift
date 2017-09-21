//
//  StorageService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 12/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class StorageService
{
    static let instance = StorageService()
    
    var deviceStorage: Bool = false
    
    public func isStoredOnDevice()
    {
        self.deviceStorage = true
    }
    
    public func callCoreDataManagers()
    {
        
    }
}
