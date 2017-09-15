//
//  UiViewControllerExtension.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 11/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

extension UIViewController
{
    public func logout()
    {
        let alert = UIAlertController(
            title: "Logout ?",
            message: "You've asked for getting logged out.",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Yes",
                comment: "Default action"),
                style: .`default`,
                handler: { _ in
                    AuthService.instance.isLoggedIn = false;
                    self.performSegue(withIdentifier: "logoutSegue", sender: self) }
            )
        )
        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Cancel",
                comment: "Default action"),
                style: .`default`,
                handler: { _ in }
            )
        )
        self.present(alert, animated: true, completion: nil)
    }
    
    public func presentDetails(_ viewControllerToPresent: UIViewController)
    {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: true, completion: nil)
    }
    
    public func dismissDetails()
    {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
}
