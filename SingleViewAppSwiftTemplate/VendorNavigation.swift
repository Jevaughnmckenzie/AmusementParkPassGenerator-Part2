//
//  VendorEntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct VendorNavigation {
    
    let vendorNavStackview = UIStackView()
    let vendor = Entrant.VendorType.self
    
    init() {
        
        let acmeButton = entrantButton(withTitle: vendor.acme.rawValue)
        let fedexButton = entrantButton(withTitle: vendor.fedex.rawValue)
        let orkinButton = entrantButton(withTitle: vendor.orkin.rawValue)
        let nWElectricalButton = entrantButton(withTitle: vendor.nWElectrical.rawValue)
        
        vendorNavStackview.addArrangedSubview(acmeButton)
        vendorNavStackview.addArrangedSubview(fedexButton)
        vendorNavStackview.addArrangedSubview(orkinButton)
        vendorNavStackview.addArrangedSubview(nWElectricalButton)
        
        vendorNavStackview.axis = .horizontal
        vendorNavStackview.alignment = .fill
        vendorNavStackview.distribution = .fillEqually
        vendorNavStackview.spacing = 0
    }
    
    func entrantButton(withTitle title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        
        
        return newButton
    }


}
