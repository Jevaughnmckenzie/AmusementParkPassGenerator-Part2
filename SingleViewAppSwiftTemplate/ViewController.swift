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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(topNav.topLevelNavStackView)
        secondNavView.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        view.addSubview(secondNavView)
//        view.addSubview(guestNav.guestNavStackView)
        
        
        topNav.guestButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        topNav.employeeButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        topNav.managerButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
        topNav.vendorButton.addTarget(nil, action: #selector(changeSubNav), for: .touchUpInside)
    }
    
    
    /*
     
     Everytime a button in the first nav is pressed:
        The second nav view hides or removes any stackviews currently displayed
        The second nav view adds a stackview corresponding to the button pressed in the first nav:
     
     
     */
    
    override func viewWillLayoutSubviews() {
        setupTopLevelNavStackView()
        setupSecondLevelNavStackView()
        addSecondLevelNavStackViews()
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
    
    
//    func displaySecondLevelNav() {
//        for subview in secondNavView.subviews {
//            subview.isHidden = true
//        }
//        print("Fuction ran")
//        let topNavButtons = TopNavigation().topLevelNavStackView.arrangedSubviews as! [UIButton]
//        for navButton in topNavButtons {
//            print("Loop Excecuted")
//            print(navButton.currentTitle)
//            switch navButton  {
//            case topNav.guestButton:
//                print("correct case chosen")
//    //
//            case topNav.employeeButton:
//                
//            case topNav.managerButton:
//               
//            case topNav.vendorButton:
//                
//            default:
//                print("Fell through to the default")
//    //                InfoError.invalidButton(description: "No such button should exist.")
//            }
//        }
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
            let buttonIndex = secondNavView.subviews.index(of: subNavStackView) {
            let subNav = secondNavView.subviews[buttonIndex]
            subNav.isHidden = false
        }
    }
    
//    func changeSubNav() {
//        let navButtonCatalog = [
//            "Guest" : guestNav.guestNavStackView,
//            "Employee" : employeeNav.employeeNavStackView,
//            "Manager" : managerNav.managerNavStackview,
//            "Vendor" : vendorNav.vendorNavStackview
//        ]
//        print("code ran")
//        for subview in secondNavView.subviews {
//            subview.isHidden = true
//        }
//        
//        if let buttonTitle = topNav.guestButton.currentTitle,
//            let subNavStackView = navButtonCatalog[buttonTitle],
//            let buttonIndex = secondNavView.subviews.index(of: subNavStackView) {
//            print("code went into desired block")
//            print(buttonIndex)
//            let subNav = secondNavView.subviews[buttonIndex] as! UIStackView
//            subNav.isHidden = false
//        }
//        
//    }
    
    
}





























































