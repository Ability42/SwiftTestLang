//: Playground - noun: a place where people can play

import UIKit

//: Reference Types Containing Value Type Properties

struct Address {
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
}

class Person {
    var name : String
    var address: Address
    
    init(name: String, address: Address) {
        self.name = name
        self.address = address
    }
}

let kingsLanding = Address(streetAddress: "1 King Way", city: "Kings Landing", state: "Westeros", postalCode: "12345")
let madKing = Person(name: "Aerys", address: kingsLanding)
let kingSlayer = Person(name: "Jaime", address: kingsLanding)

kingSlayer.address.streetAddress = "1 King Way_1"
madKing.address.streetAddress
kingSlayer.address.streetAddress

//: Value Types Containing Reference Type Properties

struct Bill {
    let amount: Float
    private var _billedTo: Person
    
    private var billedToForRead: Person {
        return _billedTo
    }
    
    private var billedToForWrite: Person {
        mutating get {
            
            if !isKnownUniquelyReferenced(&_billedTo) {
                print("making a copy of _billedTo")
                _billedTo = Person(name: _billedTo.name, address: _billedTo.address)
            } else {
                print("not making a copy of _billedTo")
            }
            return _billedTo
        }
    }
    
    mutating func updateBilledToAddress(adress: Address) {
        billedToForWrite.address = adress
    }
    
    mutating func updateBilledToName(name: String) {
        billedToForWrite.name = name
    }
    
    func getBillName() -> String {
        return billedToForRead.name
    }
    
    func getBillAddress() -> Address {
        return billedToForRead.address
    }
    
    init(amount: Float, billedTo: Person) {
        self.amount = amount
        // Create a new Person reference from the parameter
        _billedTo = Person(name: billedTo.name, address: billedTo.address)
    }
}

var billPayer = Person(name: "Vladimir", address: kingsLanding)

var myBill = Bill(amount: 99.0, billedTo: billPayer)
var billCopy = myBill

billCopy.updateBilledToName(name: "Steve")















