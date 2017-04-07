//
//  PassController.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 4/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class PassController: UIViewController {

    var pass: Pass!
//    weak var rideAccessKiosk: RideAccessKiosk!
    weak var areaAccessKiosk: AreaAccessKiosk!
//    weak var vendorStallKiosk: VendorStallKiosk!
    
    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    
    @IBOutlet weak var rideAccessPermissionLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchendiseDiscountLabel: UILabel!
    
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var testResultsMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        rideAccessKiosk = RideAccessKiosk(pass: pass)
//        areaAccessKiosk = AreaAccessKiosk(for: pass)
//        vendorStallKiosk = VendorStallKiosk(pass: pass)
        
        loadPassInfo()
    }

    
//    @IBAction func checkAreaAccessPermissions(_ sender: UIButton) {
//        
//        guard let button = sender.currentTitle else { return }
//        switch button {
//        case "Ride Control":
//            areaAccessKiosk.swipe(authorizing: .areaAccess(.rideControl))
//        case "Kitchen" :
//            areaAccessKiosk.swipe(authorizing: .areaAccess(.kitchen))
//        case "Maintenance" :
//            areaAccessKiosk.swipe(authorizing: .areaAccess(.maintenance))
//        case "Office" :
//            areaAccessKiosk.swipe(authorizing: .areaAccess(.office))
//        case "Amusement" :
//            areaAccessKiosk.swipe(authorizing: .areaAccess(.amusement))
//            
//        default:
//            //FIXME: put alert or something
//            return
//        }
//        
//    }
//    
//    @IBAction func checkRidePermissions(_ sender: UIButton) {
//        
//        guard let button = sender.currentTitle else { return }
//        switch button {
//        case "Rides":
//            rideAccessKiosk.swipe(authorizing: .rideAccess(.allRides))
//            rideAccessKiosk.swipe(authorizing: .rideAccess(.noRides))
//            rideAccessKiosk.swipe(authorizing: .ridePriority(.skipPrivilege))
//            rideAccessKiosk.swipe(authorizing: .ridePriority(.standard))
//        default:
//            return
//        }
//        
//    }
//   
//    @IBAction func checkDiscountPermissions(_ sender: UIButton) {
//        
//        guard let button = sender.currentTitle else { return }
//        switch button {
//        case "Food Discount":
//            vendorStallKiosk.swipe(authorizing: .discountAccess(.food, 5))
//            //FIXME: Add remaining code
//        default:
//            return
//        }
//        
//    }
    
    func loadPassInfo() {
        // Name
        if let firstName =  pass.personalInfo.firstName, let lastName = pass.personalInfo.lastName {
            if firstName != "" && lastName != ""{
                entrantNameLabel.text = "\(firstName) \(lastName)"
            } else {
                entrantNameLabel.text = "Guest"
            }
        }
        // Pass Type
        let entrant = pass.entrant
        switch entrant {
        case .guest(let guestType):
            switch guestType {
            case .regularGuest:
                entrantTypeLabel.text = "Adult"
            case .child :
                entrantTypeLabel.text = "Child"
            case .vip :
                entrantTypeLabel.text = "VIP"
            case .senior :
                entrantTypeLabel.text = "Senior"
            case .seasonPass :
                entrantTypeLabel.text = "Season Pass"
            }
        case .employee(let employeeType):
            switch employeeType {
            case .foodService:
                entrantTypeLabel.text = "Food Service Worker"
            case .rideService:
                entrantTypeLabel.text = "Ride Service Worker"
            case .maintenance:
                entrantTypeLabel.text = "Maintenance Worker"
            case .contract:
                entrantTypeLabel.text = "Contract Worker"
            }
        case .manager:
            entrantTypeLabel.text = "Manager"
        case .vendor(let vendor):
            switch vendor {
            case .acme:
                entrantTypeLabel.text = "Acme"
            case .fedex:
                entrantTypeLabel.text = "Fedex"
            case .orkin:
                entrantTypeLabel.text = "Orkin"
            case .nWElectrical:
                entrantTypeLabel.text = "NW Electrical"
            }
        }
        // Ride access
        switch entrant {
        case .employee(.contract), .vendor:
            rideAccessPermissionLabel.text = "No Rides"
        default:
            rideAccessPermissionLabel.text = "Unlimited Rides"

        }
        // Food and Merch. Discounts
        switch entrant {
        case .guest(.regularGuest), .guest(.child), .employee(.contract), .vendor:
            foodDiscountLabel.text = "No Food Discount"
            merchendiseDiscountLabel.text = "No Merchendise Discount"
        case .guest(.senior):
            foodDiscountLabel.text = "10% Food Discount"
            merchendiseDiscountLabel.text = "10% Merchendise Discount"
        case .guest(.vip), .guest(.seasonPass):
            foodDiscountLabel.text = "10% Food Discount"
            merchendiseDiscountLabel.text = "20% Merchendise Discount"
        case .employee(.foodService), .employee(.rideService), .employee(.maintenance):
            foodDiscountLabel.text = "15% Food Discount"
            merchendiseDiscountLabel.text = "25% Merchendise Discount"
        case .manager:
            foodDiscountLabel.text = "25% Food Discount"
            merchendiseDiscountLabel.text = "25% Merchendise Discount"
        }
    }

    @IBAction func checkOfficePermission(_ sender: UIButton) {
//        print("Joy is annoying")
//        print("\(pass.entrant)")
//        print("\(pass.getAccessPrivileges())")
        
        if areaAccessKiosk.swipeFunction(pass: .office) {
            print("yayyyyyy")
        }
        //{
//            testResultsView.backgroundColor = UIColor.green
//            testResultsMessage.text = "Access Granted"
//        } else {
//            testResultsView.backgroundColor = UIColor.red
//            testResultsMessage.text = "Access Denied"
//        }
        
        
//        if areaAccessKiosk.swipe(authorizing: .areaAccess(.office)) {
//            testResultsView.backgroundColor = UIColor.green
//            testResultsMessage.text = "Access Granted"
//        } else {
//            testResultsView.backgroundColor = UIColor.red
//            testResultsMessage.text = "Access Denied"
//        }
    }
    
    

}
