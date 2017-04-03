//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    let StreetAddressTextFeild = UITextField()
    let cityTextFeild = UITextField()
    let stateTextFeild = UITextField()
    let zipcodeTextFeild = UITextField()
    
    
    let generatePassButton = UIButton()
    let populateDataButton = UIButton()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(topNav.topLevelNavStackView)
        secondNavView.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        view.addSubview(secondNavView)
        
//        view.addSubview(wrapper)
        
//        print(wrapper.frame)
//        entrantForm.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//        
//        view.addSubview(entrantForm)
        
//        ************ Visual format layout practice *********************
        
        dobLabel.translatesAutoresizingMaskIntoConstraints = false
        firstNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        streetAddressLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        generatePassButton.translatesAutoresizingMaskIntoConstraints = false
        
        dobLabel.text = "DOB"
        firstNameLabel.text = "First Name"
        companyLabel.text = "Company"
        streetAddressLabel.text = "Street Address"
        cityLabel.text = "City"
        generatePassButton.setTitle("Generate Pass", for: .normal)
        
        generatePassButton.backgroundColor = UIColor.green
        
        view.addSubview(dobLabel)
        view.addSubview(firstNameLabel)
        view.addSubview(companyLabel)
        view.addSubview(streetAddressLabel)
        view.addSubview(cityLabel)
        view.addSubview(generatePassButton)
        
        
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
            "populateDataButton" : populateDataButton
        ]
        
        let metrics: [String : AnyObject] = [
            "labelToTextField" : 10 as AnyObject,
            "textFieldToTextFeild" : 20 as AnyObject,
            "textFeildToLabel" : 30 as AnyObject,
            "bottomSpaceOffset" : 50 as AnyObject
        ]
        
        let options: [NSLayoutFormatOptions] = [
            
        ]
        
        // First Column
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[secondNavView]-[dobLabel]-[firstNameLabel]-[companyLabel]-[streetAddressLabel]-[cityLabel]-[generatePassButton]", options: [.alignAllLeading, .alignAllCenterX], metrics: nil, views: views))
        
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
        NSLayoutConstraint.activate([
            guestNav.guestNavStackView.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
            guestNav.guestNavStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            guestNav.guestNavStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            guestNav.guestNavStackView.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        employeeNav.employeeNavStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            employeeNav.employeeNavStackView.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
            employeeNav.employeeNavStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            employeeNav.employeeNavStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            employeeNav.employeeNavStackView.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        managerNav.managerNavStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            managerNav.managerNavStackview.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
            managerNav.managerNavStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            managerNav.managerNavStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            managerNav.managerNavStackview.heightAnchor.constraint(equalToConstant: 60)
            ])
        
        vendorNav.vendorNavStackview.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            vendorNav.vendorNavStackview.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
            vendorNav.vendorNavStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            vendorNav.vendorNavStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            vendorNav.vendorNavStackview.heightAnchor.constraint(equalToConstant: 60)
            ])
        
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
    
    func entrantFormDimensions()  {
        
    }
    
    func turnOffAutoResizingMaskForElements<LayoutElement: UIView>(in array: [LayoutElement]) {
        for element in array {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    
    
    
    
}





























































