//: Playground - noun: a place where people can play

import UIKit

struct Resolution {
    var width: Int?
    var height: Int?
}

class VideoMode {
    var resolution = Resolution(width: 1280, height: 720)
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

/*** Memberwise Initializers for Structure Types ***/

let mode = VideoMode()
print("The resolution of video is \(mode.resolution)") // How to unwrap resolution

/*** Structures and Enumerations Are Value Types ***/

let fullHD = Resolution(width: 1920, height: 1080)
var cinema = fullHD

cinema.width = 2048

/*** Classes Are Reference Types ***/

let tenEighty = VideoMode()
tenEighty.resolution = fullHD
tenEighty.interlaced = true
tenEighty.frameRate = 25.0
tenEighty.name = "1080i"

let alsoTenEighty = tenEighty
tenEighty.frameRate = 50.0

print(tenEighty.frameRate)

// PROPERTIES


/*** Stored Properties ***/

struct FixedLenghtRange {
    var firstValue: Int
    let lenght: Int
}

var someRange = FixedLenghtRange(firstValue: 5, lenght: 3)
print(someRange)
someRange.firstValue = 0
print(someRange)

/*** Lazy stored properties ***/

class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

let manager = DataManager()
manager.data.append("Doc1")
manager.data.append("Doc2")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.fileName)


/*** Computed Properties ***/

struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set (newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
let currentSquareCenter = square.center
print(currentSquareCenter)
square.center.x = 10
square.center.y = 3
print(square.origin)


/*** Shorthand setter declaration ***/

struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var centerPoint: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
    
}


/*** Property Observers ***/

class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            } else if totalSteps < oldValue {
                print("Removed \(oldValue - totalSteps) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 199
stepCounter.totalSteps = 202

/*** Type property syntax ***/

struct SomeStructure {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int {
        return 42
    }
    class var ovveridableComputedTypeProperty: Int {
        return 100
    }
}

// Querying and Setting Type Properties

SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)

SomeEnumeration.storedTypeProperty = "Another value"
print(SomeEnumeration.storedTypeProperty)

// SomeClass.ovveridableComputedTypeProperty = 4 // fail
print(SomeClass.ovveridableComputedTypeProperty)


print(SomeClass.computedTypeProperty)


struct AudioChannel {
    // Two stored type properties
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

var leftChannel = AudioChannel()
var rightChannel = AudioChannel()

print("Value of left channel is: \(leftChannel.currentLevel), right cannel: \(rightChannel.currentLevel)")

leftChannel.currentLevel = 4
rightChannel.currentLevel = 13

print("Value of left channel is: \(leftChannel.currentLevel), right cannel: \(rightChannel.currentLevel)")












