//
//  VendorStallKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class VendorStallKiosk: Kiosk {
    
    let description = "VendorStallKiosk"
    
    func swipeFunction(authorizing authorization: AccessPermission.Discount) -> Bool {
        printBirthdayMessage(pass: pass)
        var catagoricalPermissions = 0
        for permission in pass.getAccessPrivileges() {
            switch permission {
            case .discountAccess(authorization, let discountAmount) :
                switch authorization {
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
        
        return false
    }
}

