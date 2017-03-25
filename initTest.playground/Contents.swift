

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















