//: Playground - noun: a place where people can play

import UIKit
/*
let names = ["Me", "You", "We", "They", "She"]

// 1
func backwards(_ xs1: String, _ xs2: String) -> Bool {
    return xs1 > xs2
}
let reversedNames = names.sorted(by: backwards)

// 2
let reversedNames_2 = names.sorted(by: { (s1, s2) in
    return s1 < s2
})
// 3
let reversedNames_3 = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// 4
let reversedNames_shortForm = names.sorted { $0 < $1 }

// 5
let yetSimplerClosure = names.sorted(by: <)
names.sorted { (s1, s2) -> Bool in
    return s1 > s2
}

*/

// Trailing Closures
let digitNames = [
    0: "9", 1: "8", 2: "7", 3: "6", 4: "5",
    5: "4", 6: "3", 7: "2", 8: "1", 9: "0"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = "" // line \n
    repeat {
        output = digitNames[number % 10]! + output //
        number /= 10
    } while number > 0
    print(output)
    return output
}


func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {

        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementBySeven = makeIncrementor(forIncrement: 7)
let incrementByTen = makeIncrementor(forIncrement: 10)

incrementBySeven()
incrementBySeven()
incrementByTen() // Important!!! Returns 10 NOT a 24 because, new runningTotal is created

let alsoIncrementBySeven = incrementBySeven
alsoIncrementBySeven()


// Escaping closures rea


var completionHandlers: [() -> Void] = [] //Array of closures(empty now)


// @escaping
func someFunctionWithEscapingClosure(completionHandler:@escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
// @nonescaping
func someFunctionWithNonEscapingClosure(closure:/* @noescape */ () -> Void) {
    closure()
}


class SomeClass {
    var x = 10
    func doSomething()  {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonEscapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)


/*** Autoclosures ***/

var customerInLine = ["Bob", "Michel", "Steve", "Andy", "Sergio"];
print(customerInLine.count)

let customerProvider = { customerInLine.remove(at: 0)}

print(customerInLine.count)     // 5 customers now
print((customerInLine.count))   // Still 5

print("Serving \(customerProvider())") // Execute closure
print(customerInLine.count)

// You get the same behavior of delayed evaluation when you pass a closure as an argument to a function.

func serve(customer customerProvider2: () -> String) {
    print("Now serving \(customerProvider2())")
}

func serve(customer customerProvider3: @autoclosure () -> String ) {
    print("Now serving \(customerProvider())")
}

serve(customer: {customerInLine.remove(at: 0)})
