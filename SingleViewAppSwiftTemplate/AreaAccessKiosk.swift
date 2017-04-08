//
//  AreaAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class AreaAccessKiosk: Kiosk {
    let description = "AreaAccessKiosk"
    
    
    func swipeFunction(authorized: AccessPermission.AreaAccess) -> Bool {
        printBirthdayMessage(pass: pass)
        var catagoricalPermissions = 0 // Used to relay whether or not an entrant has no permissions in a situation

            for permission in pass.getAccessPrivileges() {
                switch permission {
                case .areaAccess(authorized) :
                    switch  authorized {
                    case .amusement, .kitchen, .maintenance, .office, .rideControl:
                       return true
                        catagoricalPermissions += 1
                    }
                default:
                    continue
                }
            }
            
            if catagoricalPermissions == 0 {
                print("Access Denied")
            }
        
        return false
    }
}
    
