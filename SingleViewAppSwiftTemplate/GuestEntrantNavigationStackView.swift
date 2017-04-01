//
//  GuestEntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct GuestEntrantNavigationStackView {
    
    let guestEntrantNavStackView = UIStackView()
    
    
    init() {
        
        let childButton = entrantButton(withTitle: Entrant.GuestType.child.rawValue)
        let adultButton = entrantButton(withTitle: Entrant.GuestType.vip.rawValue)
        let seniorButton = entrantButton(withTitle: Entrant.GuestType.senior.rawValue)
        let vipButton = entrantButton(withTitle: Entrant.GuestType.vip.rawValue)
        
        guestEntrantNavStackView.addArrangedSubview(childButton)
        guestEntrantNavStackView.addArrangedSubview(adultButton)
        guestEntrantNavStackView.addArrangedSubview(seniorButton)
        guestEntrantNavStackView.addArrangedSubview(vipButton)
        
        guestEntrantNavStackView.axis = .horizontal
        guestEntrantNavStackView.alignment = .fill
        guestEntrantNavStackView.distribution = .fillEqually
        guestEntrantNavStackView.spacing = 0
    }
    
    func entrantButton(withTitle title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        
        
        return newButton
    }
    
}

















































