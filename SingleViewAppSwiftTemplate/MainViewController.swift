//
//  MainViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 4/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var topNav: UIView!
    @IBOutlet weak var subNav: UIView!
    let guestNav = GuestNavigation()
    let employeeNav = EmployeeNavigation()
    let managerNav = ManagerNavigation()
    let vendorNav = VendorNavigation()
    
    
    @IBOutlet weak var dobTextField: UITextField!
    @IBOutlet weak var ssnTextField: UITextField!
    @IBOutlet weak var projectNumTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextFeild = UITextField()
    @IBOutlet weak var companyTextFeild = UITextField()
    @IBOutlet weak var streetAddressTextFeild = UITextField()
    @IBOutlet weak var cityTextFeild = UITextField()
    @IBOutlet weak var stateTextFeild = UITextField()
    @IBOutlet weak var zipcodeTextFeild = UITextField()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let entrantButtons = TopNavigation(frame: topNav.frame)
        topNav.addSubview(entrantButtons)
        entrantButtons.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            entrantButtons.topAnchor.constraint(equalTo: topNav.topAnchor),
            entrantButtons.leadingAnchor.constraint(equalTo: topNav.leadingAnchor),
            entrantButtons.trailingAnchor.constraint(equalTo: topNav.trailingAnchor),
            entrantButtons.bottomAnchor.constraint(equalTo: topNav.bottomAnchor)
            ])

        
        
        entrantButtons.guestButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        entrantButtons.employeeButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        entrantButtons.managerButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        entrantButtons.vendorButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
//        setupTopLevelNavStackView()
        addSecondLevelNavStackViews()
    }
    
    // MARK: - Navigation

     
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
//    func setupTopLevelNavStackView() {
//        
//        entrantButtons.translatesAutoresizingMaskIntoConstraints = false
//        
//        
//        NSLayoutConstraint.activate([
//            entrantButtons.topAnchor.constraint(equalTo: topNav.topAnchor),
//            entrantButtons.leadingAnchor.constraint(equalTo: topNav.leadingAnchor),
//            entrantButtons.trailingAnchor.constraint(equalTo: topNav.trailingAnchor),
//            entrantButtons.bottomAnchor.constraint(equalTo: topNav.bottomAnchor)
//            ])
//    }
    
    
    func addSecondLevelNavStackViews() {
        subNav.addSubview(guestNav.guestNavStackView)
        subNav.addSubview(employeeNav.employeeNavStackView)
        subNav.addSubview(managerNav.managerNavStackview)
        subNav.addSubview(vendorNav.vendorNavStackview)
        
        //FIXME: Repetative code
        
        guestNav.guestNavStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(guestNav.guestNavStackView))
        
        employeeNav.employeeNavStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(employeeNav.employeeNavStackView))
        
        managerNav.managerNavStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(managerNav.managerNavStackview))
        
        vendorNav.vendorNavStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(vendorNav.vendorNavStackview))
        
        for subview in subNav.subviews {
            subview.isHidden = true
        }
    }
    
    func createSubNavConstraintsFor(_ stackView: UIStackView) -> [NSLayoutConstraint] {
        return [stackView.topAnchor.constraint(equalTo: subNav.topAnchor),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: subNav.bottomAnchor)
        ]
    }
    
    // MARK: Dynamic Sub Navigation
    func changeSubNav(forEntrant entrant: UIButton) {
        let navButtonCatalog = [
            "Guest" : guestNav.guestNavStackView,
            "Employee" : employeeNav.employeeNavStackView,
            "Manager" : managerNav.managerNavStackview,
            "Vendor" : vendorNav.vendorNavStackview
        ]
        
        for subview in subNav.subviews {
            subview.isHidden = true
        }
        
        if let buttonTitle = entrant.currentTitle,
            let subNavStackView = navButtonCatalog[buttonTitle],
            let subStackViewIndex = subNav.subviews.index(of: subNavStackView) {
            subNav.subviews[subStackViewIndex].isHidden = false
        }
    }

}
