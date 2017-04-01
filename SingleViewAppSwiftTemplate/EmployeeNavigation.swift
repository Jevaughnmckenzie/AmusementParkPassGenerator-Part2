//
//  EmployeeEntrantNavigationStackView.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct EmployeeNavigation {
    
    let employeeNavStackView = UIStackView()
    let employee = Entrant.EmployeeType.self
    
    init() {
        
        let rideServiceWorkerButton = entrantButton(withTitle: employee.rideService.rawValue)
        let foodServiceWorkerButton = entrantButton(withTitle: employee.foodService.rawValue)
        let maintenanceWorkerButton = entrantButton(withTitle: employee.maintenance.rawValue)
        
        employeeNavStackView.addArrangedSubview(rideServiceWorkerButton)
        employeeNavStackView.addArrangedSubview(foodServiceWorkerButton)
        employeeNavStackView.addArrangedSubview(maintenanceWorkerButton)
    }
    
    func entrantButton(withTitle title: String) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(title, for: .normal)
        newButton.setTitleColor(UIColor.white, for: .normal)
        newButton.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        
        
        return newButton
    }
}








































