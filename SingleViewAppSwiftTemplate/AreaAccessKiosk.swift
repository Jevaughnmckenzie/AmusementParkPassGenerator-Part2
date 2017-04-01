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
    
    override func swipe(pass: Pass) {
        
        var catagoricalPermissions = 0 // Used to relay whether or not an entrant has no permissions in a situation
        
        do{
            for permission in try pass.getAccessPrivileges() {
                switch permission {
                case .areaAccess(areaBeingAuthorized) :
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
            printBirthdayMessage(pass: pass)
            
        } catch InfoError.missingInformation(let object, let description) {
            print("Error in \(String(describing: object)): \(description)")
        } catch InfoError.invalidBirthday(let object, let description) {
            print("Invalid birthday set in \(String(describing: object)): \(description)")
        } catch {
            print("Uncaught error in pass.getAccesspriveleges()")
        }
    }
    
}

