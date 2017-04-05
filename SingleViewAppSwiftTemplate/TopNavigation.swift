//
//  EntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class TopNavigation: UIStackView {
    
    let guestButton: UIButton
    let employeeButton: UIButton
    let managerButton: UIButton
    let vendorButton: UIButton
    
    
    override init(frame: CGRect) {
        
        func entrantButton(withTitle title: String) -> UIButton {
            let newButton = UIButton(type: .system)
            newButton.setTitle(title, for: .normal)
            newButton.setTitleColor(UIColor.white, for: .normal)
            newButton.backgroundColor = UIColor(red: 64/255.0, green: 0, blue: 128/255.0, alpha: 0.57)
            
            
            return newButton
        }
        
        self.guestButton = entrantButton(withTitle: "Guest")
        self.employeeButton = entrantButton(withTitle: "Employee")
        self.managerButton = entrantButton(withTitle: "Manager")
        self.vendorButton = entrantButton(withTitle: "Vendor")
        
        
        super.init(frame: frame)
        
        self.addSubview(employeeButton)
        self.addSubview(guestButton)
        self.addSubview(managerButton)
        self.addSubview(vendorButton)
        
        self.distribution = .fillEqually
        self.alignment = .fill
        self.axis = .horizontal
        self.spacing = 0
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
        
}
    
    
    






















































