import Cocoa

func addInts(a: Int, b: Int) -> Int {
    return a + b
}
let intSum = addInts(a: 4, b: 7)


func addDoubles(x: Double, y: Double) -> Double {
    return x + y
}
let doubleSum = addDoubles(x: 1.0, y: 2.0)


let numbers = [1, 2, 3]
let firstNumber = numbers[0]


var numbersAgain: Array<Int> = []

numbersAgain.append(4)
numbersAgain.append(3)
numbersAgain.append(2)

let firstNumberAgain = numbersAgain[0]


let countryCodes = ["Arendelle": "AR", "Genovia": "GN", "Freedonia": "FD"]
let countryCode = countryCodes["Freedonia"]

let optionalName = Optional<String>.some("Princesse Morana")
if let name = optionalName {
    print(name)
}

//: Modeling a queue

struct Queue<Element: Equatable> {
    fileprivate var elements: [Element] = [] // 'fileprivate' means, that elements property can be accessed through this file
    
    mutating func enqueue(element: Element) {
        elements.append(element)
    }
    
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.remove(at: 0)
    }
}


//: Writing a generic function

func pairs<Key, Value>(from dict:[Key : Value]) -> [(Key, Value)] {
    return Array(dict)
}

let somePairs = pairs(from: ["avg" : 21, "max" : 42, "min" : 0])
print(somePairs)

let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])
print(morePairs)


//: Constraining a Generic Type

func mid<T: Comparable>(array: [T]) -> T? {
    guard !array.isEmpty else {
        return nil
    }
    return array.sorted()[(array.count - 1) / 2]
}


let primeNumbers = [3,17,5,13,7]
let sortedPrimes = mid(array: primeNumbers)

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int : Summable {}
extension Double : Summable {}
extension String : Summable {}

func add<T: Summable>(x: T, y:T) -> T {
    return x + y
}

let addInts = add(x: 4, y: 4)
let addDoubles = add(x: 4.5, y: 3.44)
let addStrings = add(x: "Hello", y: ", there!")

// Add an peek function to Queue struct via extension

extension Queue {
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isHomogeneus() -> Bool {
        guard let first = elements.first else {
            return true
        }
        return elements.contains{ $0 == first }
    }
    
}

var q = Queue<Int>()

q.enqueue(element: 1)
q.enqueue(element: 2)
q.enqueue(element: 3)

q.dequeue()
q.dequeue()
q.enqueue(element: 3)
q.isHomogeneus()
q.dequeue()
q.dequeue()
q.isHomogeneus()


//: Subclasing a generic type


class Box<T> {
    
}

class Gift<T> : Box<T> {
    func wrap() {
        print("Wrap with plain white paper.")
    }
}

class Rose {
    // Flower of choice for fairytale dramas
}

class ValentinesBox: Gift<Rose> {
    // A rose for your valentine
    override func wrap() {
        print("Wrap with ❤︎❤︎❤︎ paper")
    }
}

class Shoe {
    // Just regular footwear
}

class GlassSlipper: Shoe {
    // A single shoe, destined for a princess
}

class ShoeBox: Box<Shoe> {
    
}

let box = Box<Rose>()
let gift = Gift<Rose>()
let shoeBox = ShoeBox()

let valentinesBox = ValentinesBox()


gift.wrap()
valentinesBox.wrap()

//: Enumeration with associated values

enum Result<Value> {
    case success(Value), failure(Error)
}

enum MathError: Error {
    case divisionByZero
}

func divide(_ x: Int, by y: Int) -> Result<Int> {
    guard y != 0 else {
        return .failure(MathError.divisionByZero)
    }
    return .success(x/y)
}

let resultWithoutFailure = divide(32, by: 4)
let resultWithFailure = divide(42, by: 0)


