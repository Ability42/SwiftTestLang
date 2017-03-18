//: Playground - noun: a place where people can play

import UIKit

typealias AudioSample = UInt16


/*** Tuples ***/
// Creating
let httpTypeError = (404, "Not Found", "describe")
let httpRequestRetrieved = ("Status code", true)

var someValue = 5
let testTuple = (1, someValue, 2, httpTypeError)
let palitre = ("green", "black", "white")
let (_, _, whiteColor) = palitre

print("\(whiteColor) from palitre")


print("Green is #1 \(palitre.2)")

// Optional

var cars = (first: "toyota", second:"bmw", third: "lexus")

print("\(cars.first) is TOYOTA?")
print("\(cars.1) is BMW?")
print("\(cars.third) is lexus?")


// decompose a tuple’s contents into separate constants or variables,

let (statusCode, state, describes) = httpTypeError

print("httpTypeError is \(statusCode) \(state) \(describes)")
print("httpTypeError is \(httpTypeError)")


// Optionals

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber) // convertedNumber is inferred to be of type "Int?", or "optional Int"

var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String? // Automaticaly sets to nil

// forced unwrapping of the optional’s value
if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!)")
}

/* Optional Binding
 You use optional binding to find out whether an optional contains a value, and if so, to make that value available as a temporary constant or variable. Optional binding can be used with if and while statements to check for a value inside an optional, and to extract that value into a constant or variable, as part of a single action. if and while statements are described in more detail in Control Flow.
*/

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" has NOT an integer value)")
}

if let firstNumber = Int("42"), let secondNumber = Int("55"), firstNumber < secondNumber && secondNumber < 100 {
    assert(firstNumber > 0, "first number is grater than 0")
    print("\(firstNumber) is grater then \(secondNumber), maybe")
}

/***** Implicitly unwrapped optionals *****/

var possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "Some assumed string"
let impicitString = assumedString


/***** Error Handling *****/

func makeASandwitch() throws {  // ???
    // may or may not throw an error
}

do {
    try makeASandwitch()
    
} catch {
    // an error was thrown
}

// a != nil ? a! : b
// The code above uses the ternary conditional operator and forced unwrapping (a!) to access the value wrapped inside a when a is not nil, and to return b otherwise. The nil-coalescing operator provides a more elegant way to encapsulate this conditional checking and unwrapping in a concise and readable form.

let defautlColorName = "Black"
var userColorName: String?

var resultColorName = userColorName ?? defautlColorName

userColorName = "green"
resultColorName = userColorName ?? defautlColorName


// Range Operator
for index in 1...3 {
    print("\(index) in range 1..3")
}

let names = ["Stepan", "Andy", "Sergo", "Yura"]

for i in 0..<names.count {
    print("Person \(i+1) has name: \(names[i])")
}








