

//: Playground - noun: a place where people can play

struct Fahrenheit {
    var temperature: Double
    
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)")


struct Celsius {
    var temperatureInCelsius: Double
    
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
let bodyTemperature = Celsius(36.4)


print(boilingPointOfWater, freezingPointOfWater)


struct Color {
    let red, green, blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
    
}

// Note that it is not possible to call these initializers without using argument labels. Argument labels must always be used in an initializer if they are defined, and omitting them is a compile-time error

let magentaColor = Color(red: 1.0, green: 0.0, blue: 1.0)
let grayColor = Color(white: 0.75)

/*** Optional Property Types ***/

class SurveyQuestion {
    var text : String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
    
    func getResponse() -> String {
        return response!
    }
    
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()

cheeseQuestion.response = "Yes, of course"

print(cheeseQuestion.getResponse())

/*** Initializer Delegation for Value Types
// Value types -  they can only delegate to another initializer that they provide themselves. ***/


struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {}
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.width / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let zeroRect = Rect()
let rectFromOrigin = Rect(origin: Point(x: 3.0, y: 1.0),
                        size: Size(width: 2.0, height: 2.0))
let rectFromCenter = Rect(center: Point(x: 2.0, y: 2.0), size: Size(width: 4.0, height: 4.0))

print(zeroRect)
print(rectFromCenter)
print(rectFromOrigin)


class Human {
    var weight: Double
    var age: Int
    
    init(weight: Double, age: Int) {
        self.weight = weight
        self.age = age
    }
    
    convenience init(age: Int) {
        self.init(weight: 0, age: age)
    }
    
    convenience init(weight: Double) {
        self.init(weight: weight, age: 0)
    }
    
    convenience init() {
        self.init(weight: 0)
    }
    
}

class Student : Human {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
        // must call designated initializer of 'Human' superclass
        super.init(weight: 0.0, age: 0)
    }
    
    convenience init(firstName: String) {
        // A convenience initializer must delegate to another initializer before assigning a value to any property (including properties defined by the same class).
        self.init(firstName: firstName, lastName: "")
        self.age = 21
    }
    
}

let student = Student(firstName: "Bob", lastName: "Salivan")
let student2 = Student(firstName: "Steve")

//: Initializer Inheritance and Overriding

class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let someVehicle = Vehicle()
print(someVehicle.description)


class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let someBicycle = Bicycle()
print(someBicycle.description)


//: Designated and Convenience Initializers in Action

class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "[Unnamed]")
    }
    
}

let namedMeat = Food(name: "Beacon")
let myMysteryMeat = Food()

class ReciepeIngredient: Food {
    var quantity: Int
    
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
    
}

let oneMysteryItem = ReciepeIngredient();
print(oneMysteryItem.name, oneMysteryItem.quantity)

let oneBeacon = ReciepeIngredient(name: "beacon")
print(oneBeacon.name, oneBeacon.quantity)

let sixEggs = ReciepeIngredient(name: "Eggs", quantity: 6)
print(sixEggs.name, sixEggs.quantity)


class ShoppingListItem: ReciepeIngredient {
    var purchased = false
    
    var description: String {
        var output = "\(quantity) x \(name) "
        output += purchased ? "✓" : "✗"
        return output
    }

}

var breakfastList = [
    ShoppingListItem(),
    ShoppingListItem(name: "Beacon"),
    ShoppingListItem(name: "Snikers", quantity: 5)
]

breakfastList[0].name = "Orange Juice"
breakfastList[0].purchased = true

for item in breakfastList {
    print(item.description)
}

//: Failable Initializers

class Animal {
    var species: String
    
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someAnimal = Animal(species: "Giraffe")

if let giraffe = someAnimal {
    print(giraffe.species)
}

let anonymusCreature = Animal(species: "")

if anonymusCreature == nil {
    print("The anonymus creature coudn't be initialized")
}

//: Failable Initializers for Enumerations


enum TemperatureUnit {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "C")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}

//: Failable Initializers for Enumerations with Raw Values

// You can rewrite the TemperatureUnit example from above to use raw values of type Character and to take advantage of the init?(rawValue:) initializer:

enum TemperatureUnitWithRaw: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnit2 = TemperatureUnitWithRaw(rawValue: "C")

if fahrenheitUnit2 != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}

let unknownUnit2 = TemperatureUnitWithRaw(rawValue: "X")
if unknownUnit2 == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// Prints "This is not a defined temperature unit, so initialization failed."

class Product {
    let name: String
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}


//: Overriding a Failable Initializer

class Document {
    var name: String?
    
    init() {}
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
}

class AutomaticalyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

let someUntitledDocument = UntitledDocument()
print(someUntitledDocument.name!)

//: The init! Failable Initializer


class SomeClass {
    required init() {
        // some initialization code goes here
    }
}

class SomeSubclass: SomeClass {
    required init() {
        // overriding SomeClass initialization method
    }
}

//: Setting a Default Property Value with a Closure or Function

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 4, column: 5))


class Foo {
    
    var someInt = 4
    static var someStatucInt = 4
    
    func someFunc() {
        print(self.someInt)
    }
    class func someStaticFunc() {
        // ...
    }
    
    func test() {
        print("Test")
    }
    
}

Foo.someStatucInt
//: deinitialization

class Bank {
    static var coinsInBank = 10000
    
    static func distirbute(coins numberOfCoinsRequested: Int) -> Int {
        let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    
    static func recieve(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    
    init(coins: Int) {
        coinsInPurse = Bank.distirbute(coins: coins)
    }
    
    func win(coins: Int) {
        coinsInPurse += Bank.distirbute(coins: coins)
    }
    
    deinit {
        Bank.recieve(coins: coinsInPurse)
    }
}


var playerOne: Player? = Player(coins: 42)
print("A player joined to the game with \(playerOne!.coinsInPurse) coins")
print("There are \(Bank.coinsInBank) coins in the bank")


playerOne!.win(coins: 1000)
print("A player now has \(playerOne!.coinsInPurse) coins")
print("There are \(Bank.coinsInBank) coins in the bank")

playerOne = nil

print("A player now has \(playerOne?.coinsInPurse) coins")
print("There are \(Bank.coinsInBank) coins in the bank")

















