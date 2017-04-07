//
//  AreaAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class AreaAccessKiosk: Kiosk {
    let description = "AreaAccessKiosk"
    
    
    override func swipeFunction(authorizing authorization: AccessPermission) -> Bool {
        
        var catagoricalPermissions = 0 // Used to relay whether or not an entrant has no permissions in a situation
        printBirthdayMessage()
        for permission in pass.getAccessPrivileges() {
            switch permission {
            case .areaAccess(.amusement), .areaAccess(.kitchen), .areaAccess(.maintenance), .areaAccess(.office), .areaAccess(.rideControl):
                catagoricalPermissions += 1
                
                return true
                
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

