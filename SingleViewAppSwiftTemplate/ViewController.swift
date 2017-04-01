//
//  ViewController.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Treehouse on 12/8/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topNavStackView = TopNavigation().topLevelNavStackView
    
    let secondStack = SecondLevelNavigationView().secondStack
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(topNavStackView)
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
    
        topNavStackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            topNavStackView.topAnchor.constraint(equalTo: self.topLayoutGuide.bottomAnchor),
            topNavStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topNavStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topNavStackView.heightAnchor.constraint(equalToConstant: 80)
            ])
    }
    
    func setupSecondLevelNavStackView() {
        
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondStack.topAnchor.constraint(equalTo: topNavStackView.bottomAnchor),
            secondStack.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondStack.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondStack.heightAnchor.constraint(equalToConstant: 60)
            ])

    }
    
    func addSecondLevelNavStackViews() {
        secondStack.addSubview(GuestTopNavigation().guestEntrantNavStackView)
        secondStack.addSubview(EmployeeTopNavigation().employeeNavStackView)
        secondStack.addSubview(ManagerTopNavigation().managerNavStackview)
        secondStack.addSubview(VendorTopNavigation().vendorNavStackview)
        
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
        
        let topNavButtons = TopNavigation().topLevelNavStackView.arrangedSubviews
        for button in topNavButtons {
            let navButton = button as! UIButton
            if navButton.isHighlighted == true {
                switch navButton.currentTitle! {
                case :
                    secondStack.subviews[0].isHidden = false
                case "Employee":
                    secondStack.subviews[1].isHidden = false
                case "Manager":
                    secondStack.subviews[2].isHidden = false
                case "Vendor":
                    secondStack.subviews[3].isHidden = false
                default:
                    
                }
            }
        }
    }
    
    
    
}





























































