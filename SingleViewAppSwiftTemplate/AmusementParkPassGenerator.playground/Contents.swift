//: Playground - noun: a place where people can play

import UIKit
let calendar = Calendar.current

var birthdayFormated = DateFormatter()
birthdayFormated.dateFormat = "MM/dd/yyyy"

var birthday: String?
var birthdayDate: Date?

birthday = "12/23/09"

if birthday != nil {
    birthdayDate = birthdayFormated.date(from: birthday!)
}

let birthdayComponents = calendar.dateComponents([.year, .day, .month], from: birthdayDate!)

if birthdayComponents.year! < 1900 {
    
}

let vendor = "String"
vendor.lowercased()
































