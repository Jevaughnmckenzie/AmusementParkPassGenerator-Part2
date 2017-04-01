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
    
    
    
    func getAccessPrivileges() throws -> [AccessPermission] {
        
        // MARK: Entrant Information Error Handeling
        switch entrant {
        case .employee(let employeeType):
            guard personalInfo.firstName != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a First Name.")
            }
            
            guard personalInfo.lastName != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a Last Name.")
            }
            
            guard personalInfo.streetAddress != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a valid street address.")
            }
            
            guard personalInfo.city != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a valid U.S. city.")
            }
            
            guard personalInfo.state != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a valid U.S. state.")
            }
            
            guard personalInfo.zipcode != nil, personalInfo.zipcode?.characters.count == 5,
                Int.init(personalInfo.zipcode!) != nil  else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a valid U.S. zipcode.")
            }
            
            if employeeType == .contract {
                guard let projectNumber = personalInfo.projectNumber, Int(projectNumber) != nil else {
                    throw InfoError.invalidInfo(inObject: personalInfo.description,
                                                description: "Please enter a valid project number.")
                }
            }
            
        case .guest(.child):
            
            let earliestValidBirthday =  Calendar.current.date(byAdding: .year, value: -5, to: Date())!
            
            guard personalInfo.birthdayDate != nil else {
                throw InfoError.missingInformation(inObject: personalInfo.description,
                                                   description: "Please provide a valid birthday.")
            }
            guard (personalInfo.birthdayDate)! < Date() else {
                throw InfoError.invalidBirthday(inObject: personalInfo.description,
                                                description: "Appearently, this individual has not been born yet.")
            }
            
            guard (personalInfo.birthdayDate)! >= earliestValidBirthday else {
                throw InfoError.invalidBirthday(inObject: personalInfo.description,
                                                description: "This individual is too old to be entered as a Free Child.")
            }
            
        default:
            break
        }
        
        
        // Places enum representations of all permissions granted to an entrant type into an array of permissions
        switch entrant {
            
        case .guest(let guestType) :
            switch guestType {
            case .regularGuest, .child:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.standard)]
            case .vip:
                return [.areaAccess(.amusement), .rideAccess(.allRides), .ridePriority(.skipPrivilege),
                        .discountAccess(.food, 10), .discountAccess(.merchandise, 20)]
            case .senior:
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
                    throw InfoError.invalidInfo(inObject: personalInfo.description, description: "The project number entered is invalid.")
                }
            case .manager :
                return [.areaAccess(.amusement), .areaAccess(.kitchen), .areaAccess(.rideControl),
                        .areaAccess(.maintenance), .areaAccess(.office), .rideAccess(.allRides),
                        .ridePriority(.standard), .discountAccess(.food, 25), .discountAccess(.merchandise, 25)]
            }
            
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


























































