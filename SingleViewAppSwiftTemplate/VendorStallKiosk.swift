//
//  VendorStallKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class VendorStallKiosk: Kiosk {
    
    let description = "VendorStallKiosk"
    
    var discountBeingAuthorized: AccessPermission.Discount
    
    init(for discountBeingAuthorized: AccessPermission.Discount) {
        self.discountBeingAuthorized = discountBeingAuthorized
    }
    
    override func swipe(pass: Pass) {
        var catagoricalPermissions = 0
        do {
            for permission in try pass.getAccessPrivileges() {
                switch permission {
                case .discountAccess(discountBeingAuthorized, let discountAmount) :
                    switch discountBeingAuthorized {
                    case .food, .merchandise:
                        print("Please provide discount of \(discountAmount).")
                        catagoricalPermissions += 1
                    }
                default:
                    continue
                }
            }
            
            if catagoricalPermissions == 0 {
                print("No discount")
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

