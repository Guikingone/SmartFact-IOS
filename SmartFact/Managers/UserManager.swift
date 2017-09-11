//
//  UserService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 07/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class UserManager
{
    static let instance = UserManager()
    
    func create(data: Dictionary<String, Any>)
    {
        UserMock.instance.createUser(
            id: (data["id"] as? String)!,
            username: data["username"] as! String,
            firstname: data["firstname"] as! String,
            lastname: data["lastname"] as! String,
            email: data["email"] as! String
        )
    }
    
    func deleteUserData()
    {
        
    }
    
    func patchUserData()
    {
        UserMock.instance.patchUser()
    }
    
    func saveUserData()
    {
        // Once the user is logged in, we save the data into Core Data for futur usage.
        // Allow to search if the user already exist in Core Data.
        //                    do {
        //                        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        //                        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //                        let users = try managedContext.fetch(fetchRequest) as! [User]
        //                        for user in users {
        //                            if user.email == json["email"] as? String {
        //                                let personalUser = user
        //                                print(personalUser)
        //                            }
        //                        }
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
        //                    } catch {
        //                        debugPrint(error)
        //                    }
    }
}
