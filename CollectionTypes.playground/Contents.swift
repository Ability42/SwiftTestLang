//: Playground - noun: a place where people can play

import UIKit

//creating an empty array
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

someInts.append(42)
print("someInts array now contain \(someInts[0]) value")

var fourGhosts = Array(repeating: "S", count: 4)
var twoCats = Array(repeating: "B", count: 2)

var combinedArrays = fourGhosts + twoCats

var shoppingList = ["Eggs", "Milk"]

if shoppingList.isEmpty {
    print("Shopping list is empty")
} else {
    print("Shopping list isn't empty")
}

shoppingList.append("Flour")
shoppingList += ["Chocolate", "Beer"]
var firstItem = shoppingList[0]

shoppingList[2...4] = ["Mango", "Apples"]
print(shoppingList)

shoppingList[0] = "Six Eggs"
print(shoppingList)

for item in shoppingList {
    print(item)
}

shoppingList.insert("Vodka", at: 2)
let drink = shoppingList.remove(at: 2)
print(drink)
print(shoppingList)

let apples = shoppingList.removeLast()

for (index, value) in shoppingList.enumerated() {
    print("Item \(index): \(value)")
}


/***** Set *****/

var letters = Set<Character>()
letters.insert("a")
letters.insert("b")
print(letters)
letters = []

var favoriteGenres: Set<String> = ["Rock", "House", "R&B", "Classical"]
var otherGenres: Set<String> = ["Rap", "Drum&Bass"]

var unionSet = favoriteGenres.union(otherGenres)


if favoriteGenres.contains("Rap") {
    print("contains Rap")
} else {
    print("Not contains Rap")
}

for genre in unionSet.sorted() {
    print(genre)
}

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

/***** Dictionaries *****/

var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"

namesOfIntegers = [:]

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin", "???": "Uknown Airport"]

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}

for (airportCode, airport) in airports {
    print("\(airportCode): \(airport)")
}


let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

for items in airports.sorted(by: <#T##((key: String, value: String), (key: String, value: String)) -> Bool#>)








