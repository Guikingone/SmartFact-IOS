//
//  UiViewControllerExtension.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 11/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit
import LocalAuthentication

extension UIViewController
{
    public func registerFailure()
    {
        let alertTitle: String = "Registration process has failed !"
        let error: String = "To define"
        
        let registerFailureAlert = UIAlertController(
            title: alertTitle,
            message: error,
            preferredStyle: .alert
        )
        
        registerFailureAlert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Retry",
                comment: "Default action"),
                style: .`default`,
                handler: { _ in }
            )
        )
        
        self.present(registerFailureAlert, animated: true, completion: nil)
    }
    
    public func biometricLogin()
    {
        let laContext = LAContext();
        let localizedReason: String = "You need to use it !"
        let errorMessage: String = "Hey, biometric authentication has failed, for security reason, we recommend you to use classical login form."
        
        var authError: NSError?
        
        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
           laContext.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: localizedReason,
                reply: { (success, errors) in
                    
                if success {
                    AuthService.instance.isLoggedIn = true
                    self.performSegue(withIdentifier: "LoggedInSegue", sender: self)
                } else {
                    let biometricLoginAlert = UIAlertController(
                        title: "Biometric authentication has failed !",
                        message: errorMessage,
                        preferredStyle: .alert
                    )
                    biometricLoginAlert.addAction(
                        UIAlertAction(
                            title: NSLocalizedString("Accept",
                            comment: "Default action"),
                            style: .`default`,
                            handler: { _ in }
                        )
                    )
                    
                    self.present(biometricLoginAlert, animated: true, completion: nil)
                }
            })
        } else {
            debugPrint("Authentication not allowed or errored: \(String(describing: authError))")
        }
    }
    
    public func logout()
    {
        let alert = UIAlertController(
            title: "Logout ?",
            message: "You've asked for getting logged out.",
            preferredStyle: .alert
        )
        
        alert.addAction(
            UIAlertAction(
                title: NSLocalizedString("Cancel",
                                         comment: "Default action"),
                style: .`default`,
                handler: { _ in }
            )
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
