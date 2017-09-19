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
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do {
            try managedContext.fetch(fetchRequest)
            completion(true)
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
        UserMock.instance.patchUser()
    }
}
