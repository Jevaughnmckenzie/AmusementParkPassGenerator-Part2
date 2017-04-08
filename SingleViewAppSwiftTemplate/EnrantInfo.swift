//
//  Enrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/9/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct EntrantInfo {
    let description = "EntrantInfo"
    
    var firstName: String?
    var lastName: String?
    
    
    var streetAddress: String?
    var city: String?
    var state: String?
    var zipcode: String?
    
    var birthdayEntered: String?
    let birthdayFormated = DateFormatter()
    var birthdayDate: Date?
    
    var projectNumber: String?
    var company: String?
    
    init(firstName: String?, lastName: String?, birthday: String?,
         streetAddress: String?, city: String?, state: String?,
         zipcode: String?, projectNumber: String?, company: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthdayEntered = birthday
        
        self.projectNumber = projectNumber
        self.company = company
        
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipcode = zipcode
        
        var stringRange: Range<String.CharacterView.Index>
        
//        let birthdayHolder = birthday
//        birthday.
//        let birthMonth = Int(birthday?.characters.prefix(upTo: 3))
//        let birthDay = birthdayHolder?.characters[]
        
        birthdayFormated.dateFormat = "MM/dd/yyyy"
        
        if birthday != nil {
            birthdayDate = birthdayFormated.date(from: birthday!)
        }
        
    }
}

    
    
    
    
    
    
    
    
    
    





















































