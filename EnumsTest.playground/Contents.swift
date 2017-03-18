//: Playground - noun: a place where people can play

import UIKit

/*** Enumeration Syntax ***/

enum SomeEnum {
    // enum defines goes here
}

enum CompassPoint {
    case north
    case south
    case east
    case west
    // 'case' value names as "enumeration cases"
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead = CompassPoint.east
directionToHead = .west


/*** Matching Enumeration Values with a Switch Statement ***/

directionToHead = .south

// 'Switch' stament must be exhaustive

switch directionToHead {
case .north:
     print("Lots of planets have a north")
case .south:
    print("Watch out for penguins")
case .east:
    print("Where the sun rises")
case .west:
    print("Where the skies are blue")
}


let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("No life here, in my opinion")
}

/*** Associated Values ***/

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var appleBarcode = Barcode.upc(4, 61778, 51821, 6)
// The same product can be assigned a different type of barcode:
appleBarcode = .qrCode("uqRNSluUds")

switch appleBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC : \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode:
     print("QR code: \(appleBarcode).")
}

/*** Raw Values ***/

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

/*** Implicitly Assigned Raw Values ***/

enum Planett: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

enum CompassPointt: String {
    case north, south, east, west
}

let earthIndex = Planett.earth.rawValue
let sunsetDirection = CompassPointt.west.rawValue

let possibleUranIndex = Planett(rawValue: 7)


let positionToFind = 9
if let somePlanet = Planett(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("There is no humans, maybe")
    }
    
} else { print("There isn't planet at position \(positionToFind)") }


/*** Recursive Enumerations ***/


indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let ten = ArithmeticExpression.number(10)

let sum = ArithmeticExpression.addition(five, ten)
let product = ArithmeticExpression.multiplication(sum, five)

//A recursive function is a straightforward way to work with data that has a recursive structure.

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))


