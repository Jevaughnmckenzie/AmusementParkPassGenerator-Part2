////
////  RideAccessKiosk.swift
////  AmusementParkPassGenerator
////
////  Created by Jevaughn McKenzie on 3/31/17.
////  Copyright © 2017 Treehouse. All rights reserved.
////
//
class RideAccessKiosk: Kiosk {
    
    let description = "RideAccessKiosk"
    
    func swipeFunction(authorizing authorization: AccessPermission.RideAccess) -> Bool {
//        printBirthdayMessage(pass: pass)
        for permission in pass.getAccessPrivileges() {
            switch permission {
            case .rideAccess(authorization) :
                switch authorization {
                case .allRides:
                    return true
                    
                case .noRides:
                    return false
                }
            default:
                continue
            }
        }
        return false
    }
    
    func swipeFunction(authorizing authorization: AccessPermission.RidePriority) -> Bool {
        for permission in pass.getAccessPrivileges() {
            switch permission {
            case .ridePriority(let linePriority):
                switch linePriority {
                case .standard:
                    return true
                case .skipPrivilege:
                    return true
                }
            default:
                continue
            }
        }
        return false
    }
}
