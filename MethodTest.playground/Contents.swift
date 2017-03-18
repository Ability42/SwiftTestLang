//: Playground - noun: a place where people can play

import UIKit

/*** Modifying Value Types from Within Instance Methods ***/

struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX:Double, y deltaY: Double) -> Void {
        self = Point(x: x+deltaX, y: y+deltaY)
    }
}

var somePoint = Point(x: 5, y: 3)
somePoint.moveBy(x: 1, y: 1)
print(somePoint.x, "and", somePoint.y)


/*** Assigning to self Within a Mutating Method ***/

enum StateSwitch {
    case off, low, hight
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .hight
        case .hight:
            self = .off
        }
    }
}

var overlight = StateSwitch.off
overlight.next()
overlight.next()
overlight.next()


/*** Type methods ***/

class SomeClass {
    
    class func typeMethod(_ a: Int) {
        print("Called from type method, \(a)")
        self.embededTestFunction()
    }
    class func embededTestFunction() {
        
        print("test function")
    }
}

SomeClass.typeMethod(3)


struct LevelTracker {
    
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 5)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

var player2 = Player(name: "Beto")
if player2.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}


