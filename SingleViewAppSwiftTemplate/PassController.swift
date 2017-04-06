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
    weak var rideAccessKiosk: RideAccessKiosk!
    weak var areaAccessKiosk: AreaAccessKiosk!
    weak var vendorStallKiosk: VendorStallKiosk!
    
    @IBOutlet weak var entrantNameLabel: UILabel!
    @IBOutlet weak var entrantTypeLabel: UILabel!
    
    @IBOutlet weak var rideAccessPermissionLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchendiseDiscountLabel: UILabel!
    
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var testResultsMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rideAccessKiosk = RideAccessKiosk(pass: pass)
        areaAccessKiosk = AreaAccessKiosk(pass: pass)
        vendorStallKiosk = VendorStallKiosk(pass: pass)
        
        entrantNameLabel.text = "\(pass.personalInfo.firstName) \(pass.personalInfo.lastName)"
        entrantTypeLabel.text = "\(pass.entrant.type.rawValue)"
    }

    
    @IBAction func checkAreaAccessPermissions(_ sender: UIButton) {
        
        guard let button = sender.currentTitle else { return }
        switch button {
        case "Ride Control":
            areaAccessKiosk.swipe(authorizing: .areaAccess(.rideControl))
        case "Kitchen" :
            areaAccessKiosk.swipe(authorizing: .areaAccess(.kitchen))
        case "Maintenance" :
            areaAccessKiosk.swipe(authorizing: .areaAccess(.maintenance))
        case "Office" :
            areaAccessKiosk.swipe(authorizing: .areaAccess(.office))
        case "Amusement" :
            areaAccessKiosk.swipe(authorizing: .areaAccess(.amusement))
            
        default:
            //FIXME: put alert or something
            return
        }
        
    }
    
    @IBAction func checkRidePermissions(_ sender: UIButton) {
        
        guard let button = sender.currentTitle else { return }
        switch button {
        case "Rides":
            rideAccessKiosk.swipe(authorizing: .rideAccess(.allRides))
            rideAccessKiosk.swipe(authorizing: .rideAccess(.noRides))
            rideAccessKiosk.swipe(authorizing: .ridePriority(.skipPrivilege))
            rideAccessKiosk.swipe(authorizing: .ridePriority(.standard))
        default:
            return
        }
        
    }
   
    @IBAction func checkDiscountPermissions(_ sender: UIButton) {
        
        guard let button = sender.currentTitle else { return }
        switch button {
        case "Food Discount":
            vendorStallKiosk.swipe(authorizing: .discountAccess(.food, 5))
            //FIXME: Add remaining code
        default:
            return
        }
        
    }
    
    

    

}
