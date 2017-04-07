//
//  AreaAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class AreaAccessKiosk: Kiosk {
    let description = "AreaAccessKiosk"
    var areaBeingAuthorized: AccessPermission.AreaAccess
    
    init(for areaBeingAuthorized: AccessPermission.AreaAccess) {
        self.areaBeingAuthorized = areaBeingAuthorized
    }
    
    func swipeFunction(pass: Pass, au) -> Bool {
        
        var catagoricalPermissions = 0 // Used to relay whether or not an entrant has no permissions in a situation

            for permission in pass.getAccessPrivileges() {
                switch permission {
                case .areaAccess(areaBeingAuthorized) :
                    switch areaBeingAuthorized {
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
            printBirthdayMessage(pass: pass)
        return false
    }
}
    
