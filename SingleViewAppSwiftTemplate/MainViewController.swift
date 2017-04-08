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

    var allTextFields: [UITextField]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         allTextFields = [dobTextField,ssnTextField,projectNumTextField,firstNameTextField,lastNameTextField,companyTextField,streetAddressTextField,cityTextField,stateTextField,zipcodeTextField]
        
        loadTextFieldsDisabled(allTextFields)
        createTextFieldDelegatesFor(allTextFields)
        
        createTextFieldTargetActionsFor(navButtons: guestNav.guestNavStackView.arrangedSubviews as! [UIButton])
        createTextFieldTargetActionsFor(navButtons: employeeNav.employeeNavStackView.arrangedSubviews as! [UIButton])
        createTextFieldTargetActionsFor(navButtons: managerNav.managerNavStackview.arrangedSubviews as! [UIButton])
        createTextFieldTargetActionsFor(navButtons: vendorNav.vendorNavStackview.arrangedSubviews as! [UIButton])
        
    }
    
    override func viewWillLayoutSubviews() {
        addSecondLevelNavStackViews()
    }
    
    
    func addSecondLevelNavStackViews() {
        subNav.addSubview(guestNav.guestNavStackView)
        subNav.addSubview(employeeNav.employeeNavStackView)
        subNav.addSubview(managerNav.managerNavStackview)
        subNav.addSubview(vendorNav.vendorNavStackview)
        
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
    
    
    //MARK: TextField Methods
    
    func createTextFieldDelegatesFor(_ textFields: [UITextField]) {
        for textField in textFields {
            textField.delegate = self
        }
    }
    
    func loadTextFieldsDisabled(_ textFields: [UITextField]) {
        for textField in textFields {
            textField.backgroundColor = UIColor.lightGray
            textField.isUserInteractionEnabled = false
        }
    }
    
    func disableTextFields(_ textFields: [UITextField]) {
        for textField in textFields {
            textField.text = ""
            textField.isUserInteractionEnabled = false
            textField.backgroundColor = UIColor.lightGray
        }
    }
    
    func enableTextFields(_ textFields: [UITextField]) {
        for textField in textFields {
            textField.text = ""
            textField.isUserInteractionEnabled = true
            textField.backgroundColor = UIColor.white
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
            default:
                print("Error inside the 'accessTextFields' fucntion")
            }
            
            currentEntrantType = determineEntrantType(sender)
        }
    }
    
    
    func createTextFieldTargetActionsFor(navButtons buttons: [UIButton]) {
        for button in buttons {
            button.addTarget(self, action: #selector(accessTextFields(_:)), for: .touchUpInside)
        }
        
        
    }
    
    func determineEntrantType(_ sender: UIButton) -> Entrant {
        
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
                //FIXME: Put in case for Manager subTypes
            case "Acme" : return Entrant.vendor(.acme)
            case "Orkin" : return Entrant.vendor(.orkin)
            case "Fedex" : return Entrant.vendor(.fedex)
            case "NW Electrical" : return Entrant.vendor(.nWElectrical)
            default:
                return Entrant.manager
            }
        }
        return Entrant.manager
    }
    
    
    func createPass() throws -> Pass {
        let entrantInfo = EntrantInfo(firstName: firstNameTextField.text,
                                      lastName: lastNameTextField.text,
                                      birthday: dobTextField.text,
                                      streetAddress: streetAddressTextField.text,
                                      city: cityTextField.text,
                                      state: stateTextField.text,
                                      zipcode: zipcodeTextField.text,
                                      projectNumber: projectNumTextField.text,
                                      company: companyTextField.text)
        
        guard let entrantType = currentEntrantType else {
            throw InfoError.noEntrantChosen
        }
        
        // MARK: Entrant Information Error Handeling
        switch entrantType {
        case .employee(let employeeType):
            guard entrantInfo.firstName != "" else {
                throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                   description: "Please provide a First Name.")
            }
            
            guard entrantInfo.lastName != "" else {
                throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                   description: "Please provide a Last Name.")
            }
            
            guard entrantInfo.streetAddress != "" else {
                throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                   description: "Please provide a valid street address.")
            }
            
            guard entrantInfo.city != "" else {
                throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                   description: "Please provide a valid U.S. city.")
            }
            
            guard entrantInfo.state != "" else {
                throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                   description: "Please provide a valid U.S. state.")
            }
            
            guard entrantInfo.zipcode != "", entrantInfo.zipcode?.characters.count == 5,
                Int.init(entrantInfo.zipcode!) != nil  else {
                    throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                       description: "Please provide a valid U.S. zipcode.")
            }
            
            if employeeType == .contract {
                guard let projectNumber = entrantInfo.projectNumber, Int(projectNumber) != nil else {
                    throw InfoError.invalidInfo(inObject: entrantInfo.description,
                                                description: "Please enter a valid project number.")
                }
            }
            
        case .guest(.child):
            
            let earliestValidBirthday =  Calendar.current.date(byAdding: .year, value: -5, to: Date())!
            
            guard entrantInfo.birthdayDate != nil else {
                throw InfoError.missingInformation(inObject: entrantInfo.description,
                                                   description: "Please provide a valid birthday.")
            }
            guard (entrantInfo.birthdayDate)! < Date() else {
                throw InfoError.invalidBirthday(description: "Appearently, this individual has not been born yet.")
            }
            
            guard (entrantInfo.birthdayDate)! >= earliestValidBirthday else {
                throw InfoError.invalidBirthday(description: "This individual is too old to be entered as a Free Child.")
            }
            
        default:
            break
        }

        
        return Pass(entrant: entrantType, personalInfo: entrantInfo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        if segue.identifier == "generatePass" {
            
            do {
                guard let passController = segue.destination as? PassController else { return }
                passController.pass = try createPass()
                loadTextFieldsDisabled(allTextFields)
            } catch InfoError.missingInformation(let object, let hint){
                let alertController = UIAlertController(title: "Missing Information", message: "Error in \(object): \(hint)", preferredStyle: .alert)
                
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
                
            } catch InfoError.noEntrantChosen {
                let alertController = UIAlertController(title: "Missing Information", message: "Please choose an entrant and insert information.", preferredStyle: .alert)
                
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            } catch InfoError.invalidBirthday(let description){
                let alertController = UIAlertController(title: "Invalid Birthday", message: "\(description)", preferredStyle: .alert)
                
                alertController.addAction(action)
            } catch InfoError.invalidInfo(let object, let description) {
                let alertController = UIAlertController(title: "Invalid Information in \(object)", message: "\(description)", preferredStyle: .alert)
                
                alertController.addAction(action)
            } catch {
                fatalError()
            }
        }
    }

//    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
//
//    }
    
    
    

}
