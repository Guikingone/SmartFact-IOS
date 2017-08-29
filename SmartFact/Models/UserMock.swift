//
//  UserMock.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 29/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import Foundation
import CoreData

class UserMock: NSManagedObject
{
    @NSManaged var id: String
    @NSManaged var firstname: String
    @NSManaged var lastname: String
}
