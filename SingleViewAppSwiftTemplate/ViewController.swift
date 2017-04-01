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
    let secondStack = SecondLevelNavigationView().secondStack
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(topNav.topLevelNavStackView)
        secondStack.backgroundColor = UIColor(red: 46/255.0, green: 13/255.0, blue: 57/255.0, alpha: 1)
        view.addSubview(secondStack)
        
        addSecondLevelNavStackViews()
    }
    
    /*
     
     Everytime a button in the first nav is pressed:
        The second nav view hides or removes any stackviews currently displayed
        The second nav view adds a stackview corresponding to the button pressed in the first nav:
     
     
     */
    
    override func viewWillLayoutSubviews() {
        setupTopLevelNavStackView()
        setupSecondLevelNavStackView()
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
        
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondStack.topAnchor.constraint(equalTo: topNav.topLevelNavStackView.bottomAnchor),
            secondStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondStack.heightAnchor.constraint(equalToConstant: 60)
            ])

    }
    
    func addSecondLevelNavStackViews() {
        secondStack.addSubview(GuestNavigation().guestEntrantNavStackView)
        secondStack.addSubview(EmployeeNavigation().employeeNavStackView)
        secondStack.addSubview(ManagerNavigation().managerNavStackview)
        secondStack.addSubview(VendorNavigation().vendorNavStackview)
        
        for subview in secondStack.subviews {
            subview.isHidden = true
        }
    }
    
    func displaySecondLevelNav() {
        /*
         secondView.subviews button indexes:
            0: Guest
            1: Employee
            2: Manager
            3: Vendor
         */
        
        for subview in secondStack.subviews {
            subview.isHidden = true
        }
        
        let topNavButtons = TopNavigation().topLevelNavStackView.arrangedSubviews as! [UIButton]
        for navButton in topNavButtons {
            switch navButton  {
            case topNav.guestButton:
                if let guestButtonIndex = secondStack.subviews.index(of: topNav.guestButton) {
                    let guestNav = secondStack.subviews[guestButtonIndex]
                    guestNav.isHidden = false
                }
//                else {
//                    InfoError.navButtonIssue(description: "Guest Button returning nil.")
//                }
            case topNav.employeeButton:
                if let employeeButtonIndex = secondStack.subviews.index(of: topNav.employeeButton) {
                    let employeeNav = secondStack.subviews[employeeButtonIndex]
                    employeeNav.isHidden = false
                }
//               else {
//                  InfoError.navButtonIssue(description: "Employee Button returning nil.")
//               }
            case topNav.managerButton:
                if let managerButtonIndex = secondStack.subviews.index(of: topNav.managerButton) {
                    let managerNav = secondStack.subviews[managerButtonIndex]
                    managerNav.isHidden = false
                }
//                else {
//                    InfoError.navButtonIssue(description: "Manager Button returning nil.")
//                }
            case topNav.vendorButton:
                if let vendorButtonIndex = secondStack.subviews.index(of: topNav.vendorButton) {
                    let vendorNav = secondStack.subviews[vendorButtonIndex]
                    vendorNav.isHidden = false
                }
//                else {
//                    InfoError.navButtonIssue(description: "Vendor Button returning nil.")
//                }
            default:
                InfoError.invalidButton(description: "No such button should exist.")
            }
        }
    }
}





























































