//: Playground - noun: a place where people can play

import UIKit

func greet(person: String) -> String {
    let greeting = "Hello," + person + "!"
    return greeting
}

print(greet(person: "Max"), separator: "_", terminator: "\n")


func sayHelloWorld() -> String {
    return "hello, world"
}

// Function parameters and return values are extremely flexible in Swift. You can define anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options.

func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}

func printWithoutCounting(string: String) {
    let someValue = printAndCount(string: string)
    print(someValue)
}

// Test
printWithoutCounting(string: "test")
printAndCount(string:"test")


func thatReturnsATuple(array : [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}


let arrayWithInts = [3,32,42,2,5]
let (tmpMin, _) = thatReturnsATuple(array: arrayWithInts)

print("Minimus value is \(tmpMin)")


/*** Variadic Parameters ***/

func sumOf(_ series: Int...) -> Int {
    var sum = 0
    for number in series {
        sum += number
    }
    return sum
}

let tmpSum = sumOf(1,2,3,4,2,1)

if tmpSum < 14  {
    print(tmpSum)
} else {
    print("Sum is equal or grater than 14")
}

/*** In-Out parameters ***/

func swapToInt(_ a: inout Int, _ b: inout Int) {
    let tempA = a
    a = b
    b = tempA
}

var firstInt = 10
var secondInt = 42


swapToInt(&firstInt, &secondInt)

print(firstInt, secondInt)


// Function Types

func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunc:(Int, Int) -> Int = addTwoInts
mathFunc = multiplyTwoInts



// Function like paramentr

func printFunctionResult(funcLikeParam: (Int, Int) -> Int, _ x: Int, _ y: Int) {
    print(funcLikeParam(x,y))
}

printFunctionResult(funcLikeParam: multiplyTwoInts, 4, 13)
mathFunc = addTwoInts
printFunctionResult(funcLikeParam: mathFunc, 3, 9)

/*** Function Types as Return Type ***/

func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let chooseDirection  = chooseStepFunction(backward: currentValue < 10)

while currentValue != 0 {
    print("Value is \(currentValue)")
    currentValue = chooseDirection(currentValue)
}
print("zero_0")

// Nested function

func chooseStepFunctionInScope(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
currentValue = 13

let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
currentValue = moveNearerToZero(currentValue)

// Some Clousers


func hardProccesingWithString(input: String, completion:(_ result: String) -> Void) {
    completion("Task Done")
}

let welcome = "Welcome"
hardProccesingWithString(input: welcome) { (result) in
    print("got back :\(result)")
}


// Server manager
func getArticlesFromServer(withTypeOf: String, completion:(_ jsonHandler: [String:String]) -> Void) {
    
}

// call ServerManager function from VC









