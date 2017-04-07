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
    let areaAccess = AccessPermission.AreaAccess.self
    let rideAccess = AccessPermission.RideAccess.self
    let ridePriority = AccessPermission.RidePriority.self
    
    let entrant: Entrant
    let personalInfo: EntrantInfo
    
    init(entrant: Entrant, personalInfo: EntrantInfo) {
        self.entrant = entrant
        self.personalInfo = personalInfo
    }
    
    
    
    func getAreaAccessPrivileges() -> [AccessPermission.AreaAccess] {
        // Places enum representations of all permissions granted to an entrant type into an array of permissions
        switch entrant {
            
        case .guest(let guestType) :
            switch guestType {
            case .regularGuest, .child, .seasonPass, .senior, .vip:
                return [areaAccess.amusement]
            }
            
        case .employee(let employeeType) :
            switch employeeType {
            case .foodService :
                return [areaAccess.amusement, areaAccess.kitchen]
            case .rideService :
                return [areaAccess.amusement, areaAccess.rideControl]
            case .maintenance :
                return [areaAccess.amusement, areaAccess.kitchen, areaAccess.rideControl, areaAccess.maintenance]
            case .contract:
                let projectNumber = personalInfo.projectNumber
                let contractType = Entrant.EmployeeType.ContractType.self
                switch projectNumber! {
                case contractType.project1.rawValue:
                    return
                        [areaAccess.amusement, areaAccess.rideControl]
                case contractType.project2.rawValue:
                    return
                        [areaAccess.amusement, areaAccess.rideControl, areaAccess.maintenance]
                case contractType.project3.rawValue:
                    return
                        [areaAccess.amusement, areaAccess.rideControl, areaAccess.kitchen,
                         areaAccess.maintenance, areaAccess.office]
                case contractType.project4.rawValue:
                    return
                        [areaAccess.office]
                case contractType.project5.rawValue:
                    return
                        [areaAccess.kitchen, areaAccess.maintenance]
                default:
                    return []
                }
            }
        case .manager :
            return [areaAccess.amusement, areaAccess.kitchen, areaAccess.rideControl,
                    areaAccess.maintenance, areaAccess.office]
        
        
        case .vendor(let vendorType):
            switch vendorType {
            case .acme:
                return [areaAccess.kitchen]
            case .fedex:
                return [areaAccess.maintenance, areaAccess.office]
            case .orkin:
                return [areaAccess.amusement, areaAccess.rideControl, areaAccess.kitchen,
                        ]
            case .nWElectrical:
                return [areaAccess.amusement, areaAccess.rideControl, areaAccess.kitchen,
                        areaAccess.maintenance, areaAccess.office]
            }
        }
    }
    
    func getRideAccessPermissions() -> [AccessPermission.RideAccess] {
        switch entrant {
            
        case .guest(let guestType) :
            switch guestType {
            case .regularGuest, .child, .seasonPass, .senior, .vip:
                return [rideAccess.allRides]
            }
            
        case .employee(let employeeType) :
            switch employeeType {
            case .foodService, .maintenance, .rideService :
                return [rideAccess.allRides]
            case .contract:
                let projectNumber = personalInfo.projectNumber
                let contractType = Entrant.EmployeeType.ContractType.self
                switch projectNumber! {
                case contractType.project1.rawValue:
                    return
                        [rideAccess.noRides]
                case contractType.project2.rawValue:
                    return
                        [rideAccess.noRides]
                case contractType.project3.rawValue:
                    return
                        [rideAccess.noRides]
                case contractType.project4.rawValue:
                    return
                        [rideAccess.noRides]
                case contractType.project5.rawValue:
                    return
                        [rideAccess.noRides]
                default:
                    return []
                }
            }
        case .manager :
            return [rideAccess.allRides]
            
            
        case .vendor(let vendorType):
            switch vendorType {
            case .acme, .fedex, .orkin, .nWElectrical:
                return [rideAccess.noRides]
            }
        }
    }
    func getRidePriorityPermissions() -> [AccessPermission.RidePriority] {
        switch entrant {
            
        case .guest(let guestType) :
            switch guestType {
            case .regularGuest, .child:
                return [ridePriority.standard]
            case .vip, .seasonPass, .senior:
                return [ridePriority.skipPrivilege]
            }
            
        case .employee(let employeeType) :
            switch employeeType {
            case .foodService, .rideService, .maintenance :
                return [ridePriority.standard]
            case .contract:
                let projectNumber = personalInfo.projectNumber
                let contractType = Entrant.EmployeeType.ContractType.self
                switch projectNumber! {
                case contractType.project1.rawValue:
                    return
                        []
                case contractType.project2.rawValue:
                    return
                        []
                case contractType.project3.rawValue:
                    return
                        []
                case contractType.project4.rawValue:
                    return
                        []
                case contractType.project5.rawValue:
                    return
                        []
                default:
                    return []
                }
            }
        case .manager :
            return [ridePriority.standard]
            
            
        case .vendor(let vendorType):
            return [ridePriority.standard]
            }
        }

//    func getDiscountPermissions() -> [AccessPermission.Discount] {
//       switch entrant {
//        case .guest(let guestType) :
//            switch guestType {
//            case .regularGuest, .child:
//                return [.discountAccess(.food, 0), .discountAccess(.merchandise, 0)]
//            case .vip, .senior:
//                return [.discountAccess(.food, 10), .discountAccess(.merchandise, 20)]
//            case .senior:
//                return [.discountAccess(.food, 10), .discountAccess(.merchandise, 10)]
//            }
//            
//        case .employee(let employeeType) :
//            switch employeeType {
//            case .foodService, .rideService, .maintenance :
//                return [.discountAccess(.food, 15), .discountAccess(.merchandise, 25)]
//            case .contract:
//                let projectNumber = personalInfo.projectNumber
//                let contractType = Entrant.EmployeeType.ContractType.self
//                switch projectNumber! {
//                case contractType.project1, contractType.project2, contractType.project3, contractType.project4, contractType.project5:
//                    return [.discountAccess(.food, 0), .discountAccess(.merchandise, 0)]
//                }
//            }
//        case .manager :
//            return [.discountAccess(.food, 25), .discountAccess(.merchandise, 25)]
//            
//            
//        case .vendor(let vendorType):
//            switch vendorType {
//            case .acme:
//                return [.discountAccess(.food, 0), .discountAccess(.merchandise, 0)]
//            }
//        }
//    }

}

























































