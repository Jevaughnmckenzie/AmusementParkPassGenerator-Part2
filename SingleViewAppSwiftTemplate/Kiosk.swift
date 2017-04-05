//
//  Kiosk.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Jevaughn McKenzie on 3/10/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

protocol Swipeable {
    var pass: Pass { get }
    func swipeFunction(authorizing authorization: AccessPermission) // depending on the kiosk, it returns a string after determining privileges
    func swipe(authorizing: AccessPermission) // prevents a swipe from occuring twice when called on a particular instance
    func printBirthdayMessage()
}


// This is the main class of kiosk that is never actually called.
// The subclasses are always ustilized instead
class Kiosk: Swipeable {
    
    var pass: Pass
    var timeStampHistory = [String]()
    let calendar = Calendar.current
    
    
    init (pass: Pass) {
        self.pass = pass
    }
    
    func swipeFunction(authorizing authorization: AccessPermission) { // preforms all the actual acts involved in checking permissions
        print("Please pick a more spesific kiosk.")
        
    }
    
    func swipe(authorizing authorization: AccessPermission) { // The swipe function preforms a "double swipe check" before calling the swipe function
        let timestampFormatter = DateFormatter()
        let swipeTimeStamp = Date()
        
        timestampFormatter.dateStyle = .none
        timestampFormatter.timeStyle =  .medium
        let timestamp = timestampFormatter.string(from:swipeTimeStamp)
        
        timeStampHistory.append(timestamp)
        
        // convert elements of timestampHistory back into dates and compare them
        timestampFormatter.dateFormat = "hh:mm:ss a."
        
        // Does not check for doubleswipe if there is not two timestamps in the timeStampHistory array
        if timeStampHistory.count < 2 {
            swipeFunction(authorizing: authorization)
        } else{
        
        let previousTimeStampIndex = timeStampHistory.count - 2
            let previousTimeStamp = timeStampHistory[previousTimeStampIndex]
        
            let currentTimeStampIndex = timeStampHistory.count - 1
            let currentTimeStamp = timeStampHistory[currentTimeStampIndex]
        
            if let currentSwipe = timestampFormatter.date(from: currentTimeStamp),
                let lastSwipe = timestampFormatter.date(from: previousTimeStamp) {
                let nextAbilityToSwipe = lastSwipe.addingTimeInterval(5)
                if currentSwipe > nextAbilityToSwipe {
                    swipeFunction(authorizing: authorization)
                } else {
                    print("Please try again later")
                }
            }
        }
    }
    
    func printBirthdayMessage() {
        if let  birthdayDate = pass.personalInfo.birthdayDate {
            let birthdayDateComponents = calendar.dateComponents([.year, .month, .day], from: birthdayDate)
            let currentDayComponents = calendar.dateComponents([.year, .month, .day], from: Date())
            
            if  birthdayDateComponents.month == currentDayComponents.month
                && birthdayDateComponents.day == currentDayComponents.day {
                    print("Happy Birthday!")
            }
        }
    }
}





















































