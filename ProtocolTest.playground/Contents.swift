//: Playground - noun: a place where people can play

import UIKit

protocol SomeProtocol {
    var mustBeSettable: Int { set get }
    var doesNotNeedToBeSettable: Int { get }

}

protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

protocol FullyNamed {
    var fullName: String { get }
}


class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: nil)
print(ncc1701.prefix ?? -1)


protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("Here's another : \(generator.random())")

//: Mutating Method Requirements

protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on, off
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

var switcher = OnOffSwitch.off
switcher.toggle()

//: Initializer Requirements



protocol SomeProtcol {
    init(someParams: Int)
}

class SomeClass: SomeProtcol {
    required init(someParams: Int) {
        // initializers implementation goes here
    }
}

protocol SomeProtcl {
    init()
}

class SomeSuperClass {
    init() {
        
    }
}

class SomeSubClass: SomeSuperClass, SomeProtcl {
    required override init() {
        
    }
}


//: Protocols as Types

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

//var diceWithSixSides = Dice(sides: 6, generator: LinearCongruentialGenerator())
//for _ in 1...5 {
//    print("Random dice roll is \(diceWithSixSides.roll())")
//}

//: !!! Delegation !!!

/// The DiceGame protocol is a protocol that can be adopted by any game that involves dice.
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

/// The DiceGameDelegate protocol can be adopted by any type to track the progress of a DiceGame.
protocol DiceGameDelegate {
    func gameDidStart(_ game: DiceGame)
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

/// This version is adapted to use a Dice instance for its dice-rolls; to adopt the DiceGame protocol; 
/// and to notify a DiceGameDelegate about its progress:
class SnakeAndLadders: DiceGame {
    
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    
    init() {
        board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    
    var delegate: DiceGameDelegate?
    
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        
        gameLoop: while square != finalSquare {
            let diceRoll = dice.roll()
            delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
            
            switch square + diceRoll {
            case finalSquare:
                break gameLoop
            case let newSquare where newSquare > finalSquare:
                continue gameLoop
            default:
                square += diceRoll
                square += board[square]
            }
        }
        
        delegate?.gameDidEnd(self)
    }
}

class DiceGameTracker: DiceGameDelegate {
    
    var numberOfTurns = 0
    
    func gameDidStart(_ game: DiceGame) {
        numberOfTurns = 0
        if game is SnakeAndLadders {
             print("Started a new game of Snakes and Ladders")
        }
        print("The game usind \(game.dice.sides)-sides dice")
    }
    
    func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        numberOfTurns += 1
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game lasted for \(numberOfTurns) turns")
    }
}

let tracker = DiceGameTracker()
let game = SnakeAndLadders()
game.delegate = tracker
game.play()


//: Adding Protocol Conformance with an Extension

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
print(d12.textualDescription)


extension SnakeAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}

print(game.textualDescription)


//: Declaring Protocol Adoption with an Extension

struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let simon = Hamster(name: "Simon")
let smthTextRepresentable: TextRepresentable = simon
print(smthTextRepresentable.textualDescription)


//: Collections of Protocol Types

let things: [TextRepresentable] = [game, d12, simon]

for thing in things {
    print(thing.textualDescription)
}

//: Protocol Inheritance

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension SnakeAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            
            switch board[index] {
            case let ladder where ladder > 0:
                output += "▲"
            case let snake where snake < 0:
                output += "▼"
            default:
                output += "○"
            }
        }
        return output
    }
}

print(game.prettyTextualDescription)


//: Protocol Composition

protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)! 🎊🎉")
}

let steve = Person(name: "Steve", age: 21)

wishHappyBirthday(to: steve)


//: Checking protocol conformance

protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.1415927
    var radius: Double
    var area: Double { return pi * radius * radius }
    init(radius: Double) { self.radius = radius }
}


class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) { self.legs = legs }
}

let someObjects: [AnyObject] = [
    Circle(radius: 5),
    Animal(legs: 4),
    Country(area: 665)
]

for object in someObjects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}


//: Optional Protocol Requirments

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncremnt: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncremnt {
            count += amount
        }
    }
}

class ThreeSource: NSObject, CounterDataSource {
    
    @objc(fixedIncremnt) let fixedIncremnt = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...3 {
    counter.increment()
    print(counter.count)
}

//: Here’s a more complex data source called TowardsZeroSource, 
//: which makes a Counter instance count up or down towards zero from its current count value:

@objc class TovardsToZero: NSObject, CounterDataSource {
    func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TovardsToZero()

for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

//: Protocol extension

extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() < 0.5
    }
}

let anotherGenerator = LinearCongruentialGenerator()
print("Random value is \(anotherGenerator.random())")
print("Random value grater than 0.5? \(anotherGenerator.randomBool())")

extension PrettyTextRepresentable {
    var prettytextualDescription: String {
        return textualDescription
    }
}

extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]

print(hamsters.textualDescription)