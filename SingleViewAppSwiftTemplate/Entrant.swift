//
//  EntrantType.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 3/31/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

enum Entrant {
    case guest(GuestType)
    case employee(EmployeeType)
    case manager
    case vendor(VendorType)
    
    enum GuestType: String {
        case regularGuest = "Guest"
        case vip = "VIP"
        case child = "Child"
        case senior = "Senior"
        case seasonPass = "Season Pass"
    }
    
    enum EmployeeType: String {
        case foodService = "Food Service"
        case rideService = "Ride Service"
        case maintenance = "Maintenance"
        case contract = "Contract"
        
        enum ContractType: String {
            case project1 = "1001"
            case project2 = "1002"
            case project3 = "1003"
            case project4 = "2001"
            case project5 = "2002"
        }
    }
    
    enum ManagerType: String {
        case shift = "Shift"
        case general = "General"
        case senior = "Head"
    }
    
    enum VendorType: String {
        case acme = "Acme"
        case orkin = "Orkin"
        case fedex = "Fedex"
        case nWElectrical = "NW Electrical"
    }
}
