//: Playground - noun: a place where people can play

import UIKit

//: Reference Types

class Dog {
    var wasFed = false
}

struct Cat {
    var wasFed = false
}


let dog = Dog()
var cat = Cat()

dog.wasFed = true
cat.wasFed = true


//: When to use value types

struct Point: CustomStringConvertible {
    var x: Float
    var y: Float
    
    var description: String {
        return "{x: \(x), y: \(y)}"
    }
}

let point1 = Point(x: 2, y: 3)
let point2 = Point(x: 2, y: 3)

extension Point: Equatable { }

func ==(lhs: Point, rhs: Point) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}

struct Shape {
    var center: Point
}

let initialPoint = Point(x: 0, y: 0)
let circle = Shape(center: initialPoint)
var square = Shape(center: initialPoint)

square.center.x = 5

class Account {
    var balance = 0
}

class Person {
    let account :Account
    init(_ account: Account) {
        self.account = account
    }
}

let account = Account()

let person1 = Person(account)
let person2 = Person(account)

person2.account.balance += 42

person1.account.balance
person2.account.balance







		