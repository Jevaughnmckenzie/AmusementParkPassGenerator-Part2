//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let topNav = TopNavigation()
    let secondNavView = SecondLevelNavigationView().secondStack
    let guestNav = GuestNavigation()
    let employeeNav = EmployeeNavigation()
    let managerNav = ManagerNavigation()
    let vendorNav = VendorNavigation()
    
    let dobLabel = UILabel()
    let ssnLabel = UILabel()
    let projectNumLabel = UILabel()
    let firstNameLabel = UILabel()
    let lastNameLabel = UILabel()
    let companyLabel = UILabel()
    let streetAddressLabel = UILabel()
    let cityLabel = UILabel()
    let stateLabel = UILabel()
    let zipcodeLabel = UILabel()
    
    let dobTextFeild = UITextField()
    let ssnTextFeild = UITextField()
    let projectNumTextFeild = UITextField()
    let firstNameTextFeild = UITextField()
    let lastNameTextFeild = UITextField()
    let companyTextFeild = UITextField()
    let streetAddressTextFeild = UITextField()
    let cityTextFeild = UITextField()
    let stateTextFeild = UITextField()
    let zipcodeTextFeild = UITextField()
    
    
    let generatePassButton = UIButton()
    let populateDataButton = UIButton()
    
    var entrantFormSubviews: Array<UIView> = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dobStack = UIStackView(arrangedSubviews: [dobLabel, dobTextFeild])
        let ssnStack = UIStackView(arrangedSubviews: [ssnLabel, ssnTextFeild])
        let projectNumStack = UIStackView(arrangedSubviews: [projectNumLabel, projectNumTextFeild])
        let firstNameStack = UIStackView(arrangedSubviews: [firstNameLabel, firstNameTextFeild])
        let lastNameStack = UIStackView(arrangedSubviews: [lastNameLabel, lastNameTextFeild])
        let companyStack = UIStackView(arrangedSubviews: [companyLabel, companyTextFeild])
        let streetAddressStack = UIStackView(arrangedSubviews: [streetAddressLabel, streetAddressTextFeild])
        let cityStack = UIStackView(arrangedSubviews: [cityLabel, cityTextFeild])
        let stateStack = UIStackView(arrangedSubviews: [stateLabel, stateTextFeild])
        let zipcodeStack = UIStackView(arrangedSubviews: [zipcodeLabel, zipcodeTextFeild])
        let buttonsStack = UIStackView(arrangedSubviews: [generatePassButton, populateDataButton])
        
        let sectionOneStack = UIStackView(arrangedSubviews: [dobStack, ssnStack, projectNumStack])
        let sectionTwoStack = UIStackView(arrangedSubviews: [firstNameStack, lastNameStack])
        let sectionThreeStack = UIStackView(arrangedSubviews: [companyStack])
        let sectionFourStack = UIStackView(arrangedSubviews: [streetAddressStack])
        let sectionFiveStack = UIStackView(arrangedSubviews: [cityStack, stateStack, zipcodeStack])
        let sectionSixStack = UIStackView(arrangedSubviews: [buttonsStack])
        
        let entrantFormStack = UIStackView(arrangedSubviews: [sectionOneStack,
                                                              sectionTwoStack,
                                                              sectionThreeStack,
                                                              sectionFourStack,
                                                              sectionFiveStack,
                                                              sectionSixStack])
        
        makeStackViewVertical([dobStack, ssnStack, projectNumStack, firstNameStack, lastNameStack, companyStack,streetAddressStack,cityStack,stateStack, zipcodeStack, entrantFormStack])
        
        
        makeStackViewHorizontal([sectionOneStack,sectionTwoStack,sectionThreeStack,sectionFourStack,sectionFiveStack,sectionSixStack])
        
        entrantFormSubviews = [
            topNav.topLevelNavStackView,
            secondNavView,
            entrantFormStack
        ]
        
        stackViewFormattingFor([buttonsStack, entrantFormStack,sectionOneStack,sectionTwoStack,sectionThreeStack,sectionFourStack,sectionFiveStack,sectionSixStack])
        
        addToMasterView(entrantFormSubviews)
        turnOffAutoResizingMaskForElements(in: entrantFormSubviews)
        
        secondNavView.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        
        

        
//        ************ Visual format layout practice *********************
        
        
        dobLabel.text = "DOB"
        ssnLabel.text = "SSN"
        projectNumLabel.text = "Project #"
        firstNameLabel.text = "First Name"
        lastNameLabel.text = "Last Name"
        companyLabel.text = "Company"
        streetAddressLabel.text = "Street Address"
        cityLabel.text = "City"
        stateLabel.text = "State"
        zipcodeLabel.text = "Zipcode"
        generatePassButton.setTitle("Generate Pass", for: .normal)
        populateDataButton.setTitle("Populate Data", for: .normal)
        
        generatePassButton.backgroundColor = UIColor.green
        populateDataButton.backgroundColor = UIColor.lightGray
        
        
        let views: [String : AnyObject] = [
            "secondNavView" : secondNavView,
            "dobLabel" : dobLabel,
            "ssnLabel" : ssnLabel,
            "projectNumLabel" : projectNumLabel,
            "firstNameLabel" : firstNameLabel,
            "lastNameLabel" : lastNameLabel,
            "companyLabel" : companyLabel,
            "streetAddressLabel" : streetAddressLabel,
            "cityLabel" : cityLabel,
            "stateLabel" : stateLabel,
            "zipcodeLabel" : zipcodeLabel,
            "generatePassButton" : generatePassButton,
            "populateDataButton" : populateDataButton,
            "entrantFormStack" : entrantFormStack
        ]
        
        let metrics: [String : AnyObject] = [
            "subNavToEntrantForm" : 30 as AnyObject,
            "entrantFormToSuperView" : 0 as AnyObject,
            "labelToTextField" : 10 as AnyObject,
            "textFieldToTextFeild" : 20 as AnyObject,
            "textFeildToLabel" : 30 as AnyObject,
            "bottomSpaceOffset" : 50 as AnyObject
        ]
        
        
        // First Column
//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[secondNavView]-[dobLabel]-[firstNameLabel]-[companyLabel]-[streetAddressLabel]-[cityLabel]-[generatePassButton]", options: [.alignAllLeading, .alignAllCenterX], metrics: nil, views: views))
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[secondNavView]-subNavToEntrantForm-[entrantFormStack]-bottomSpaceOffset-|", options: [], metrics: metrics, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-entrantFormToSuperView-[entrantFormStack]-entrantFormToSuperView-|", options: [], metrics: metrics, views: views))
        
//        ****************************************************************
        
        
        
        topNav.guestButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        topNav.employeeButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        topNav.managerButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        topNav.vendorButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
    }
    
    
    override func viewWillLayoutSubviews() {
        setupTopLevelNavStackView()
        setupSecondLevelNavStackView()
        addSecondLevelNavStackViews()
//        setupTableViewWrapper()
    }
    
    func setupTopLevelNavStackView() {
    
        topNav.topLevelNavStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            topNav.topLevelNavStackView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
            topNav.topLevelNavStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topNav.topLevelNavStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topNav.topLevelNavStackView.heightAnchor.constraint(equalToConstant: 80)
            ])
    }
    
    func setupSecondLevelNavStackView() {
        
        secondNavView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondNavView.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
            secondNavView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondNavView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondNavView.heightAnchor.constraint(equalToConstant: 60)
            ])
    }
    
    func addSecondLevelNavStackViews() {
        secondNavView.addSubview(guestNav.guestNavStackView)
        secondNavView.addSubview(employeeNav.employeeNavStackView)
        secondNavView.addSubview(managerNav.managerNavStackview)
        secondNavView.addSubview(vendorNav.vendorNavStackview)
        
        //FIXME: Repetative code
        
        guestNav.guestNavStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(guestNav.guestNavStackView))
        
        employeeNav.employeeNavStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(employeeNav.employeeNavStackView))
        
        managerNav.managerNavStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(managerNav.managerNavStackview))
        
        vendorNav.vendorNavStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(createSubNavConstraintsFor(vendorNav.vendorNavStackview))
        
        for subview in secondNavView.subviews {
            subview.isHidden = true
        }
    }
    
//    func setupTableViewWrapper() {
//        
//        wrapper.translatesAutoresizingMaskIntoConstraints = false
//        
////        wrapper.addSubview(entrantForm)
//        
//        NSLayoutConstraint.activate([
//            wrapper.topAnchor.constraint(equalTo: secondNavView.bottomAnchor),
//            wrapper.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            wrapper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            wrapper.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            ])
//    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return products.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        
//        cell.textLabel?.text = products[indexPath.row]
//        
//        return cell
//    }
    
    func changeSubNav(forEntrant entrant: UIButton) {
        let navButtonCatalog = [
            "Guest" : guestNav.guestNavStackView,
            "Employee" : employeeNav.employeeNavStackView,
            "Manager" : managerNav.managerNavStackview,
            "Vendor" : vendorNav.vendorNavStackview
        ]
        
        for subview in secondNavView.subviews {
            subview.isHidden = true
        }
        
        if let buttonTitle = entrant.currentTitle,
            let subNavStackView = navButtonCatalog[buttonTitle],
            let subStackViewIndex = secondNavView.subviews.index(of: subNavStackView) {
            let subNav = secondNavView.subviews[subStackViewIndex]
            subNav.isHidden = false
        }
    }
    
    /*
     
     declutter viewcontroller:
        reduce repetative code
     create an array to hold all the on screen views
     create a function that returns a stack view with a label and text field
     
     
     */
    
    func turnOffAutoResizingMaskForElements<LayoutElement: UIView>(in array: [LayoutElement]) {
        for element in array {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func addToMasterView(_ subviews: [UIView]) {
        for subview in subviews {
            view.addSubview(subview)
        }
    }
    
    func createEntrantFormStackViews() {
        
    }
    
    func createSubNavConstraintsFor(_ stackView: UIStackView) -> [NSLayoutConstraint] {
        return [stackView.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        stackView.heightAnchor.constraint(equalToConstant: 60)]
    }
    
    func makeStackViewVertical(_ stacks: [UIStackView]) {
        for stack in stacks{
            stack.axis = .vertical
        }
    }
    
    func makeStackViewHorizontal(_ stacks: [UIStackView]) {
        for stack in stacks {
            stack.axis = .horizontal
        }
    }
    
    func stackViewFormattingFor(_ stacks: [UIStackView]) {
        for stack in stacks {
            stack.distribution = .fillEqually
            stack.alignment = .leading
            stack.spacing = 20
        }
    }
    
    
}





























































