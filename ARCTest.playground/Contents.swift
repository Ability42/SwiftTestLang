//: ARC

class Personn {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Personn?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

//: Unowned references

class Customer {
    let name: String
    var creditCard: CreditCard?
    init(name: String) {
        self.name = name
    }
    
    deinit { print("\(self.name) is being deinitilized") }
}


class CreditCard {
    let number: UInt64
    unowned/*(unsafe)*/ var customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.customer = customer
        self.number = number
    }
    deinit { print("Card #\(number) is being deinitialized") }
}


var john: Customer?
john = Customer(name: "Steve Woznyak")
john?.creditCard = CreditCard(number: 1234_5678_9012_3456, customer: john!)

john = nil

//: Unowned References and Implicitly Unwrapped Optional Properties

class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Ukraine", capitalName: "Kiev")
print(country.capitalCity.name)
print(country.name)

//: Strong Reference Cycles for Closures

class HTMLElement {
    let name: String
    var text: String?
    
    lazy var asHTML:() -> String = {
        [unowned self] in   // here we declare 'self' like unowned ref to avoid strong ref cycles
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
    
}


let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "<p>", text: "hi there!")
print(paragraph!.asHTML())

paragraph = nil

//: Resolving Strong Reference Cycles for Closures
















