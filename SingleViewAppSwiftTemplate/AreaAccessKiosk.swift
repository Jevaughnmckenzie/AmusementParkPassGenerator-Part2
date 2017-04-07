//
//  AreaAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class AreaAccessKiosk: Kiosk {
    let description = "AreaAccessKiosk"
    
    
    override func swipeFunction(authorizing authorization: AccessPermission.AreaAccess) -> Bool {
        
        var catagoricalPermissions = 0 // Used to relay whether or not an entrant has no permissions in a situation
        printBirthdayMessage()
        for permission in pass.getAccessPrivileges() {
            switch permission {
            case .areaAccess(authorization) :
                switch areaBeingAuthorized {
                case .amusement, .kitchen, .maintenance, .office, .rideControl:
                    print("Access authorized")
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

