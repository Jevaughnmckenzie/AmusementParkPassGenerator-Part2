//
//  RideAccessKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class RideAccessKiosk: Kiosk {
    
    let description = "RideAccessKiosk"
    
    override func swipeFunction(authorizing authorization: AccessPermission) {
        do {
            for permission in try pass.getAccessPrivileges() {
                    switch authorization {
                    case .rideAccess(.allRides):
                        print("Ride access granted!")
                        
                    case .rideAccess(.noRides):
                        print("Ride access denied.")
                    case .ridePriority(.standard):
                        print("Please enter at the end of the line.")
                    case .ridePriority(.skipPrivilege):
                        print("Please proceed to the end of the line.")
                
                    default:
                        continue
                }
            }
            
            printBirthdayMessage()
            
        }  catch InfoError.missingInformation(let object, let description) {
            print("Error in \(String(describing:object)): \(description)")
        } catch InfoError.invalidBirthday(let description) {
            print("Invalid birthday: \(description)")
        } catch {
            print("Uncaught error in pass.getAccesspriveleges()")
        }
        
    }
}
