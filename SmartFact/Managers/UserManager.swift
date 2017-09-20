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
    
    public func getUser(data: UserStruct, completion: (_: Bool) -> ())
    {
        UserMock.instance.createUser(
            id: data.id,
            username: data.username,
            firstname: data.firstname,
            lastname: data.lastname,
            email: data.email
        )
        
        // TODO: Fetch to find if an user is already saved.
        //       If the user is found, store it into the Manager via a new instance.
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "username == %@", UserMock.instance.username)
        
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
    
    public func createUser(data: UserStruct, completion: (_: Bool) -> ())
    {
        UserMock.instance.createUser(
            id: data.id,
            username: data.username,
            firstname: data.firstname,
            lastname: data.lastname,
            email: data.email
        )
        
        guard let managedcontext = appDelegate?.persistentContainer.viewContext else { return }
        
        let user = User(context: managedcontext)
        user.id = UserMock.instance.id
        user.username = UserMock.instance.username
        user.firstname = UserMock.instance.firstname
        user.lastname = UserMock.instance.lastname
        user.email = UserMock.instance.email
        
        do {
            try managedcontext.save()
            completion(true)
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func deleteUserData()
    {
        
    }
    
    func patchUserData()
    {
        
    }
}
