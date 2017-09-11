//
//  UIViewControllerDataExtensio.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 11/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit
import CoreData

extension UIViewController
{
    public func fetch(entityname: String, completion: (_ complete: Bool) -> ())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityname)
        
        do {
            try managedContext.fetch(fetchRequest)
            completion(true)
        } catch {
            debugPrint(error.localizedDescription)
            completion(false)
        }
    }
    
    public func save()
    {
        
    }
}
