//: Playground - noun: a place where people can play

import UIKit

let base = 3
let power = 10
var answer = 1

for _ in 1...power {
    answer *= base
}

print("\(base) to the power of \(power) is \(answer)")

// value binding

let somePoint = (2,42)

switch somePoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the x-axis with an x value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

let anotherPoint = (6, -1)
switch anotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}


let someCharacter: Character = "s"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

let stillAnotherPoint = (2,0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
     print("On an axis, \(distance) from the origin")
default:
     print("Not on an axis")
}

// Control Transfer Statements

let puzzleInput = "great minds think alike"
var puzzleOutput = ""

let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput.characters {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}

print(puzzleOutput)


// Guard

func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."


// Checking API Availability


if #available(iOS 10, macOS 10.13, *) {
    print("Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS")
} else {
    print("Fall back to earlier iOS and macOS APIs")
}

		