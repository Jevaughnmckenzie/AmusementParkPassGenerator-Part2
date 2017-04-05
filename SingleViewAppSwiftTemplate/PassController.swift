//
//  PassController.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 4/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class PassController: UIViewController {

    var pass: Pass?
    weak var rideAccessKiosk: RideAccessKiosk!
    weak var areaAccessKiosk: AreaAccessKiosk!
    weak var vendorStallKiosk: VendorStallKiosk!
    
    @IBOutlet weak var testResultsView: UIView!
    @IBOutlet weak var testResultsMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let verifiedPass = pass else {
            //FIXME: Remove before submition
            fatalError("No Pass found")
        }
        
        rideAccessKiosk = RideAccessKiosk(pass: verifiedPass)
        areaAccessKiosk = AreaAccessKiosk(pass: verifiedPass)
        vendorStallKiosk = VendorStallKiosk(pass: verifiedPass)
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
