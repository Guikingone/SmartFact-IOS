//
//  UIButtonExtension.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 12/09/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

extension UIButton
{
    public func setSelectedColor()
    {
        self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    public func setDeselectedColor()
    {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
