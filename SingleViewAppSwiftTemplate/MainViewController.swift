//
//  MainViewController.swift
//  AmusementParkPassGenerator
//
//  Created by Jevaughn McKenzie on 4/4/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

protocol EntrantPassDelegate {
    
}



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
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var companyTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    var currentEntrantType: Entrant?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dobTextField.delegate = self
        ssnTextField.delegate = self
        projectNumTextField.delegate = self
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        companyTextField.delegate = self
        streetAddressTextField.delegate = self
        cityTextField.delegate = self
        stateTextField.delegate = self
        zipcodeTextField.delegate = self
        
        createTextFieldTargetActionsFor(navButtons: guestNav.guestNavStackView.arrangedSubviews as! [UIButton])
        createTextFieldTargetActionsFor(navButtons: employeeNav.employeeNavStackView.arrangedSubviews as! [UIButton])
        createTextFieldTargetActionsFor(navButtons: managerNav.managerNavStackview.arrangedSubviews as! [UIButton])
        createTextFieldTargetActionsFor(navButtons: vendorNav.vendorNavStackview.arrangedSubviews as! [UIButton])
        
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
    
    @IBAction func changeSubNav(_ sender: UIButton) {
        let navButtonCatalog = [
            "Guest" : guestNav.guestNavStackView,
            "Employee" : employeeNav.employeeNavStackView,
            "Manager" : managerNav.managerNavStackview,
            "Vendor" : vendorNav.vendorNavStackview
        ]
        
        for subview in subNav.subviews {
            subview.isHidden = true
        }
        
        if let buttonTitle = sender.currentTitle,
            let subNavStackView = navButtonCatalog[buttonTitle],
            let subStackViewIndex = subNav.subviews.index(of: subNavStackView) {
            subNav.subviews[subStackViewIndex].isHidden = false
        }
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
    
    
    
    
    func disableTextFields(_ textFields: [UITextField]) {
        for textField in textFields {
//            textField.text = ""
            textField.isUserInteractionEnabled = false
        }
    }
    
    func enableTextFields(_ textFields: [UITextField]) {
        for textField in textFields {
//            textField.text = ""
            textField.isUserInteractionEnabled = true
        }
    }
    
    func accessTextFields(_ sender: UIButton){
        
        if let button = sender.currentTitle {
            //FIXME: Put i case for Manager subTypes
            switch button {
            case "Child", "Adult", "VIP", "Senior":
                enableTextFields([dobTextField,firstNameTextField, lastNameTextField])
                disableTextFields([ssnTextField,projectNumTextField,companyTextField,streetAddressTextField,cityTextField,stateTextField,zipcodeTextField])
            case "Food Service", "Ride Service", "Maintenance":
                enableTextFields([dobTextField,firstNameTextField, lastNameTextField,streetAddressTextField,cityTextField,stateTextField,zipcodeTextField])
                disableTextFields([ssnTextField, projectNumTextField,companyTextField])
            case "Contract" :
                enableTextFields([dobTextField,projectNumTextField,firstNameTextField, lastNameTextField,streetAddressTextField,cityTextField,stateTextField,zipcodeTextField])
                disableTextFields([ssnTextField,companyTextField])
            case "Acme", "Orkin", "Fedex", "NW Electrical" :
                enableTextFields([firstNameTextField, lastNameTextField, companyTextField,dobTextField])
                disableTextFields([ssnTextField,streetAddressTextField,cityTextField,stateTextField,zipcodeTextField])
            }
            
            currentEntrantType = determineEntrantType(sender)
        }
    }
    
    
    func createTextFieldTargetActionsFor(navButtons buttons: [UIButton]) {
        for button in buttons {
            button.addTarget(self, action: #selector(accessTextFields(_:)), for: .touchUpInside)
        }
        
        
    }
    
    func determineEntrantType(_ sender: UIButton) -> Entrant? {
        
        if let entrant = sender.currentTitle{
            switch entrant {
            case "Child": return Entrant.guest(.child)
            case "Adult" : return Entrant.guest(.regularGuest)
            case "VIP" : return Entrant.guest(.vip)
            case "Senior" : return Entrant.guest(.senior)
            case "Food Service" : return Entrant.employee(.foodService)
            case "Ride Service" : return Entrant.employee(.rideService)
            case "Maintenance" : return Entrant.employee(.maintenance)
            case "Contract" : return Entrant.employee(.contract)
                //FIXME: Put i case for Manager subTypes
            case "Acme" : return Entrant.vendor(.acme)
            case "Orkin" : return Entrant.vendor(.orkin)
            case "Fedex" : return Entrant.vendor(.fedex)
            case "NW Electrical" : return Entrant.vendor(.nWElectrical)
            default:
                return Entrant.manager
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier = "generatePass" {
            
        }
    }

    
    
    

}
