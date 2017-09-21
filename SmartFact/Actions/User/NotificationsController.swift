//
//  File.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 14/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class NotificationsController: UIViewController
{
    @IBAction func deleteAllNotifications(_ sender: Any)
    {
        let alertTitle: String = "Deleting all notifications"
        let error: String = "To define"
        
        let notificationsDeletionAlert = UIAlertController(
            title: alertTitle,
            message: error,
            preferredStyle: .alert
        )
        
        notificationsDeletionAlert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Cancel",
                comment: "Default action"),
                style: .`default`,
                handler: { _ in }
            )
        )
        
        notificationsDeletionAlert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Accept",
                comment: "Default action"),
                style: .`default`,
                handler: { _ in
                    // TODO: Delete every notifications
                    NotificationsManager.instance.deleteNotifications()
                }
            )
        )
        
        self.present(notificationsDeletionAlert, animated: true, completion: nil)
    }
}
