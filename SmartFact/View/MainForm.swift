//
//  MainForm.swift
//  SmartFact
//
//  Created by Guillaume Loulier on 21/08/2017.
//  Copyright © 2017 Guillaume Loulier. All rights reserved.
//

import UIKit

class MainForm: UITextField
{
    override func awakeFromNib()
    {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        setupView()
    }
    
    public func setupView()
    {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        
        self.attributedPlaceholder = placeholder
    }
}
