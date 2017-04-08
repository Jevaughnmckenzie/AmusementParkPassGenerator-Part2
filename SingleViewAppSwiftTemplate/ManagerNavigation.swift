//
//  ManagerEntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct ManagerNavigation {
    
    let managerNavStackview = UIStackView()
    let manager = Entrant.ManagerType.self
    
    init() {
        
        let seniorButton = entrantButton(withTitle: manager.senior.rawValue)
        let generalButton = entrantButton(withTitle: manager.general.rawValue)
        let shiftButton = entrantButton(withTitle: manager.shift.rawValue)
        
        managerNavStackview.addArrangedSubview(seniorButton)
        managerNavStackview.addArrangedSubview(generalButton)
        managerNavStackview.addArrangedSubview(shiftButton)
        
        managerNavStackview.axis = .horizontal
        managerNavStackview.alignment = .fill
        managerNavStackview.distribution = .fillEqually
        managerNavStackview.spacing = 0
    }
    
    func entrantButton(withTitle title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        
        
        return newButton
    }
    
}
