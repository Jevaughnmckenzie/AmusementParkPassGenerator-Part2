//
//  VendorStallKiosk.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class VendorStallKiosk: Kiosk {
    
    let description = "VendorStallKiosk"
    
    override func swipeFunction(authorizing authorization: AccessPermission) -> Bool {
        var catagoricalPermissions = 0
        for permission in try pass.getAccessPrivileges() {
            switch authorization {
            case .discountAccess(let discountType, let discountAmount) :
                switch discountType {
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
        printBirthdayMessage()
    }
}

