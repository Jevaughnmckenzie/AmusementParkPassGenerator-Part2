////
////  RideAccessKiosk.swift
////  AmusementParkPassGenerator
////
////  Created by Jevaughn McKenzie on 3/31/17.
////  Copyright © 2017 Treehouse. All rights reserved.
////
//
//class RideAccessKiosk: Kiosk {
//    
//    let description = "RideAccessKiosk"
//    
//    func swipe(authorizing authorization: AccessPermission.RideAccess) -> Bool {
//            for permission in try pass.getAccessPrivileges() {
//                switch permission {
//                case .rideAccess(authorization) :
//                    switch authorization {
//                    case .allRides:
//                        return true
//                        
//                    case .noRides:
//                        return false
//                    }
//                case .ridePriority(let linePriority):
//                    switch linePriority {
//                    case .standard:
//                        return true
//                    case .skipPrivilege:
//                        return true
//                    }
//    
//                }
//            }
//            
//            printBirthdayMessage()
//        
//    }
//}
