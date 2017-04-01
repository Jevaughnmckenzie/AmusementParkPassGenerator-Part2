//
//  RideAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class RideAccessKiosk: Kiosk {
    
    let description = "RideAccessKiosk"
    var rideBeingAuthorized: AccessPermission.RideAccess
    
    init(for rideBeingAuthorized: AccessPermission.RideAccess) {
        self.rideBeingAuthorized = rideBeingAuthorized
    }
    
    override func swipe(pass: Pass) {
        do {
            for permission in try pass.getAccessPrivileges() {
                switch permission {
                case .rideAccess(rideBeingAuthorized) :
                    switch rideBeingAuthorized {
                    case .allRides:
                        print("Ride access granted!")
                        
                    case .noRides:
                        print("Ride access denied.")
                    }
                case .ridePriority(let linePriority):
                    switch linePriority {
                    case .standard:
                        print("Please enter at the end of the line.")
                    case .skipPrivilege:
                        print("Please proceed to the end of the line.")
                    }
                default:
                    continue
                }
            }
            
            printBirthdayMessage(pass: pass)
            
        }  catch InfoError.missingInformation(let object, let description) {
            print("Error in \(String(describing:object)): \(description)")
        } catch InfoError.invalidBirthday(let object, let description) {
            print("Invalid birthday set in \(String(describing:object)): \(description)")
        } catch {
            print("Uncaught error in pass.getAccesspriveleges()")
        }
        
    }
}
