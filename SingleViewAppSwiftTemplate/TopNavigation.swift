//
//  EntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct EntrantNavigationStackView {
    
    enum EntrantNavButton: String {
        case Guest
        case Employee
        case Manager
        case Vendor
    }
    
    let topLevelNavStackView = UIStackView()
    
    init() {
        
        let guestButton = entrantButton(withTitle: "Guest")
        let employeeButton = entrantButton(withTitle: "Employee")
        let managerButton = entrantButton(withTitle: "Manager")
        let vendorButton = entrantButton(withTitle: "Vendor")
        
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
    
    func entrantButton(withTitle title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor(red: 64/255.0, green: 0, blue: 128/255.0, alpha: 0.57)


        return newButton
    }
    
    func createButtons() {
        
    }
    
    func showSecondNavigation() {
        
    }
        
}
    
    
    






















































