//
//  UserService.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 07/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

class UserService
{
    static let instance = UserService()
    
    public private(set) var id: String = ""
    public private(set) var username: String = ""
    public private(set) var firstname: String = ""
    public private(set) var lastname: String = ""
    public private(set) var email: String = ""
    
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
    
    func setUserData(id: String, username: String, firstname: String, lastname:String, email: String)
    {
        self.id = id
        self.username = username
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
    }
    
    func deleteUserData()
    {
        
    }
    
    func patchUserData()
    {
        
    }
}
