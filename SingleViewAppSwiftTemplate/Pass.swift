//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Pass {
    let description = "Pass"
    
    let entrant: Entrant
    let personalInfo: EntrantInfo
    
    init(entrant: Entrant, personalInfo: EntrantInfo) {
        self.entrant = entrant
        self.personalInfo = personalInfo
    }
    
    
    
    func getAccessPrivileges() -> [AccessPermission] {
        
        // Places enum representations of all permissions granted to an entrant type into an array of permissions
        switch entrant {
            
        case .guest(let guestType) :
            switch guestType {
            case .regularGuest, .child:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.standard)]
            case .vip:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.skipPrivilege),
                        .discountAccess(.food, 10), .discountAccess(.merchandise, 20)]
            case .senior, .seasonPass:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.skipPrivilege),
                        .discountAccess(.food, 10), .discountAccess(.merchandise, 10)]
                
            }
            
        case .employee(let employeeType) :
            switch employeeType {
            case .foodService :
                return [.areaAccess(.amusement), .areaAccess(.kitchen), .rideAccess(.allRides),
                        .ridePriority(.standard), .discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
            case .rideService :
                return [.areaAccess(.amusement), .areaAccess(.rideControl), .rideAccess(.allRides),
                        .ridePriority(.standard), .discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
            case .maintenance :
                return [.areaAccess(.amusement), .areaAccess(.kitchen), .areaAccess(.rideControl),
                        .areaAccess(.maintenance), .rideAccess(.allRides), .ridePriority(.standard),
                        .discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
            case .contract:
                let projectNumber = personalInfo.projectNumber
                let contractType = Entrant.EmployeeType.ContractType.self
                switch projectNumber! {
                case contractType.project1.rawValue:
                    return
                        [.areaAccess(.amusement), .areaAccess(.rideControl), .rideAccess(.noRides)]
                case contractType.project2.rawValue:
                    return
                        [.areaAccess(.amusement), .areaAccess(.rideControl), .areaAccess(.maintenance),
                         .rideAccess(.noRides)]
                case contractType.project3.rawValue:
                    return
                        [.areaAccess(.amusement), .areaAccess(.rideControl), .areaAccess(.kitchen),
                         .areaAccess(.maintenance), .areaAccess(.office), .rideAccess(.noRides)]
                case contractType.project4.rawValue:
                    return
                        [.areaAccess(.office), .rideAccess(.noRides)]
                case contractType.project5.rawValue:
                    return
                        [.areaAccess(.kitchen), .areaAccess(.maintenance), .rideAccess(.noRides)]
                default:
                    return []
                }
            }
        case .manager :
            return [.areaAccess(.amusement), .areaAccess(.kitchen), .areaAccess(.rideControl),
                    .areaAccess(.maintenance), .areaAccess(.office), .rideAccess(.allRides),
                    .ridePriority(.standard), .discountAccess(.food, 25), .discountAccess(.merchandise, 25)]
            
            
        case .vendor(let vendorType):
            switch vendorType {
            case .acme:
                return [.areaAccess(.kitchen), .rideAccess(.noRides)]
            case .fedex:
                return [.areaAccess(.maintenance), .areaAccess(.office), .rideAccess(.noRides)]
            case .orkin:
                return [.areaAccess(.amusement), .areaAccess(.rideControl), .areaAccess(.kitchen),
                        .rideAccess(.noRides)]
            case .nWElectrical:
                return [.areaAccess(.amusement), .areaAccess(.rideControl), .areaAccess(.kitchen),
                        .areaAccess(.maintenance), .areaAccess(.office), .rideAccess(.noRides)]
            }
        }
    }
}


























































