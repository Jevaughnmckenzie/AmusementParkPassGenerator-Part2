//
//  EntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct TopNavigation {
    
    let guestButton: UIButton
    let employeeButton: UIButton
    let managerButton: UIButton
    let vendorButton: UIButton
    
    enum TopNavButton {
        case Guest(UIButton)
        case Employee(UIButton)
        case Manager(UIButton)
        case Vendor(UIButton)
    }
    
    let topLevelNavStackView = UIStackView()
    
    init() {
        
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
        
        topLevelNavStackView.addArrangedSubview(guestButton)
        topLevelNavStackView.addArrangedSubview(employeeButton)
        topLevelNavStackView.addArrangedSubview(managerButton)
        topLevelNavStackView.addArrangedSubview(vendorButton)
        
//        guestButton.addTarget(guestButton, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        
        topLevelNavStackView.translatesAutoresizingMaskIntoConstraints = false
        
        topLevelNavStackView.axis = .horizontal
        topLevelNavStackView.alignment = .fill
        topLevelNavStackView.distribution = .fillEqually
        topLevelNavStackView.spacing = 0
//        topLevelNavStackView.backgroundColor = UIColor(red: 64/255.0, green: 0, blue: 128/255.0, alpha: 0.57)
        
        
    }
    
    
    
    func createButtons() {
        
    }
    
    func showSecondNavigation() {
        
    }
        
}
    
    
    






















































