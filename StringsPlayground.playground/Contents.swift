//: Playground - noun: a place where people can play

import UIKit

var welcome = "hello"

welcome.insert("!", at: welcome.endIndex)
welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))

//welcome.remove(at: welcome.startIndex)
//print("\(welcome)")

let range = welcome.index(welcome.endIndex, offsetBy: -7)..<welcome.endIndex
welcome.removeSubrange(range)


let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var mansionCount = 0
var cellCount = 0
var totalActs: Int = 0
print("\(totalActs)")

for acts in romeoAndJuliet {
    if acts.hasPrefix("Act") {
        print("Act #\(totalActs) with ID: \"\(acts)\"")
        totalActs += 1
    }
}

// Comparing Strings

let quote = "Some quote that mathes😁"
let otherQuote = "Some quote that mathes😁"

if quote == otherQuote {
    print("\nquotes are equals")
}

// Encoding
for item in quote.utf16 {
    print("\(item)", separator:"", terminator: " ")
}
print("\n")

for scalar in otherQuote.unicodeScalars {
    print("\(scalar)")
}






		