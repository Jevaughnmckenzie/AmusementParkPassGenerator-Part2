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
    var rideAccessKiosk: RideAccessKiosk!
    var areaAccessKiosk: AreaAccessKiosk!
    var vendorStallKiosk: VendorStallKiosk!
    
    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    
    @IBOutlet weak var rideAccessPermissionLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchendiseDiscountLabel: UILabel!
    
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var testResultsMessage: UILabel!
    
    weak var playSoundEffects = Buzzer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        areaAccessKiosk = AreaAccessKiosk(pass: pass)
        rideAccessKiosk = RideAccessKiosk(pass: pass)
        vendorStallKiosk = VendorStallKiosk(pass: pass)
        
        loadPassInfo()
    }

    func loadPassInfo() {
        // Name
        if let firstName =  pass.personalInfo.firstName, let lastName = pass.personalInfo.lastName {
            if firstName != "" && lastName != ""{
                entrantNameLabel.text = "\(firstName) \(lastName)"
            } else {
                entrantNameLabel.text = "Guest"
            }
        }
        //MARK: Pass Type
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
        
        // MARK: Ride access
        switch entrant {
        case .employee(.contract), .vendor:
            rideAccessPermissionLabel.text = "No Rides"
        default:
            rideAccessPermissionLabel.text = "Unlimited Rides"

        }
        // MARK: Food and Merch. Discounts
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
    // MARK: Access Testing functions
    func areaAccessTestingFor(_ area: AccessPermission.AreaAccess) {
        if  areaAccessKiosk.swipe(forPermission: area, with: areaAccessKiosk.swipeFunction) {
            testResultsView.backgroundColor = UIColor.green
            testResultsMessage.text = "Access Granted"
            playSoundEffects?.playSound(for: self)
        } else {
            testResultsView.backgroundColor = UIColor.red
            playSoundEffects?.playSound(for: self)
            testResultsMessage.text = "Access Denied"
        }
    }
    
    func rideAccessTesting() {
        if  rideAccessKiosk.swipe(forPermission: .allRides, with: rideAccessKiosk.swipeFunction) {
            testResultsView.backgroundColor = UIColor.green
            playSoundEffects?.playSound(for: self)
            testResultsMessage.text = "Access Granted"
            if rideAccessKiosk.swipe(forPermission: .standard, with: rideAccessKiosk.swipeFunction) {
                testResultsMessage.text = testResultsMessage.text! + "\nStandard Rider"
            } else if rideAccessKiosk.swipe(forPermission: .skipPrivilege, with: rideAccessKiosk.swipeFunction) {
                testResultsMessage.text = testResultsMessage.text! + "\nExpress Rider"
        } else {
            testResultsView.backgroundColor = UIColor.red
                playSoundEffects?.playSound(for: self)
            testResultsMessage.text = "Access Denied"
        }
    }
    
}
    
    func discountAccessTestingFor(_ discount: AccessPermission.Discount) {
        if vendorStallKiosk.swipe(forPermission: discount, with: vendorStallKiosk.swipeFunction) {
            testResultsMessage.text = "Discount Granted. See pass for details."
            testResultsView.backgroundColor = UIColor.green
            playSoundEffects?.playSound(for: self)
        } else {
            testResultsView.backgroundColor = UIColor.red
            testResultsMessage.text = "Discount Denied."
            playSoundEffects?.playSound(for: self)
        }
    }
    
    @IBAction func checkOfficePermission(_ sender: UIButton) {
        guard let buttonTitle = sender.currentTitle else {
            fatalError("Access Testing button without title.")
        }
        testResultsMessage.text = ""
        switch buttonTitle{
        case "Office":
            areaAccessTestingFor(.office)
        case "Kitchen":
            areaAccessTestingFor(.kitchen)
        case "Maintenance":
            areaAccessTestingFor(.maintenance)
        case "Ride Control": areaAccessTestingFor(.rideControl)
        case "Amusement": areaAccessTestingFor(.amusement)
        case "Rides":
            rideAccessTesting()
        case "Food Discount":
            discountAccessTestingFor(.food)
        case "Merch. Discount":
            discountAccessTestingFor(.merchandise)
        default:
            fatalError("Invalid Button")
        }
        
    }

    func clearPass() {
        testResultsMessage.text = "Test Results"
        testResultsView.backgroundColor = UIColor.white
    }
    
    @IBAction func createNewPass() {
        dismiss(animated: true, completion: clearPass)
    }
}
