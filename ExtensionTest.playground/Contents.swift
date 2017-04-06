//: Playground - noun: a place where people can play

import UIKit

extension Double {
    var km: Double  { return self * 1_000 }
    var m: Double   { return self }
    var cm: Double  { return self / 10 }
    var mm: Double  { return self / 1_000 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}


let rect = Rect()

let memberwiseRect = Rect(origin: Point(x: 2.0, y: 3.0),
                          size: Size(width: 3.0, height: 5.0))

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let centerRect = Rect(center: Point(x: 3.0, y: 4.0), size: Size(width: 2.0, height: 2.0))
// If you provide a new initializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.

//: Methods

extension Int {
    func repetition(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    mutating func square() {
        self = self * self
    }
    
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self/decimalBase) % 10
    }
    
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}

3.repetition {
    print("Repeat self")
}

//: Mutating instance methods

var someInt = 5
someInt.square()

//: Subscripts

print([3,4,1,-32,0])

func printIntegerKinds(_ numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .negative:
            print("- ", terminator: "")
        case .zero:
            print("0 ", terminator: "")
        case .positive:
            print("+ ", terminator: "")
        }
    }
    print("")
}

printIntegerKinds([4,-1,0])




