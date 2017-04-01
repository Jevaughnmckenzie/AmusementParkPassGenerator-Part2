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
    
    init() {
    }
    
    func entrantButton(withTitle title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        
        
        return newButton
    }
    
}
