//
//  ApiManagerService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 18/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation

class ApiManagerService
{
    func chooseEnv(env: String)
    {
        if (env == "Prod") {
            return self.connectToProduction()
        }
        
        if (env == "Dev") {
            return self.connectToDevelopment()
        }
    }
    
    func connectToProduction()
    {
        return self.getUri(env: URI_PROD)
    }
    
    func connectToDevelopment()
    {
        return self.getUri(env: URI_DEV)
    }
    
    func getUri(env: String)
    {
        
    }
}
