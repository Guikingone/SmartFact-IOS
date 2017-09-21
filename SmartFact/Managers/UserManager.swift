//
//  UserService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 07/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import CoreData

class UserManager
{
    static let instance = UserManager()
    
    // TODO: Update the method in order to return data if the user is found.
    //       If the user isn't found, return failure(true).
    public func getUser(data: UserStruct.Response, completion: (_: Bool) -> ())
    {
        // TODO: Fetch to find if an user is already saved.
        //       If the user is found, store it into the Manager via a new instance.
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username == %@", data.username)
        
        do {
            let user = try managedContext.fetch(fetchRequest)
        
            if user.count >= 0 {
                completion(true)
            } else {
                completion(false)
            }
        } catch {
            debugPrint("Could not fetch: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    // TODO: Update the method according to the fact that if the user is created, it should be returned for further calls.
    //       If the user can't be created, failure(true).
    public func createUser(data: UserStruct.Response, success: @escaping (_: Bool) -> (), failure: @escaping (_: Bool) -> ())
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
    
    func deleteUserData()
    {
        
    }
    
    func patchUserData()
    {
        
    }
}
