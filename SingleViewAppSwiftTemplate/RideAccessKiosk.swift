//
//  RideAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class RideAccessKiosk: Kiosk {
    
    let description = "RideAccessKiosk"
    
    func swipeFunction(authorizing authorization: AccessPermission.RideAccess) -> Bool {
        for permission in pass.getRideAccessPrivileges() {
                switch authorization {
                case .rideAccess(.allRides):
                    return true
                    
                case .rideAccess(.noRides):
                    return false
            }
        }
    func swipeFunction(authorizing authorization: AccessPermission.RidePriority) -> Bool {
            for permission in pass.getRidePriorityPermissions() {
                if authorization == permission {
                 AccessPermission.RidePriority.standard:
                    return true
                } else if 
                AccessPermission.RidePriority.skipPrivilege:
                    return false
                default:
                    continue
            }
        }
        
        printBirthdayMessage()
        return false
    }
}
