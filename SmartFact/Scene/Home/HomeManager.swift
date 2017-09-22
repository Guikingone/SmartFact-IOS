//
//  HomeManager.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 22/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import CoreData

class HomeManager
{
    // TODO: Update the method according to the fact that if the user is created, it should be returned for further calls.
    //       If the user can't be created, failure(true).
    public func saveUser(data: UserStruct.postUserData, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
    {
        guard let managedcontext = appDelegate?.persistentContainer.viewContext else { return }
        
        let user = User(context: managedcontext)
        user.id = data.id
        user.username = data.username
        user.firstname = data.firstname
        user.lastname = data.lastname
        user.email = data.email
        
        do {
            try managedcontext.save()
            success(true)
        } catch {
            failure(true)
            debugPrint("Could not save: \(error.localizedDescription)")
        }
    }
}
