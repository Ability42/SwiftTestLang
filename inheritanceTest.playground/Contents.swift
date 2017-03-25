//: Playground - noun: a place where people can play

//: Subscripts

struct TimeTable {
    var multiplier: Int
    
    subscript(index: Int) -> Int {
        return index * multiplier
    }
    
    init(_ multi: Int) {
        self.multiplier = multi
    }
}

// Subscriptin overload

struct Matrix {
    
    let rows: Int, columns: Int
    var grid: [Double]
    
    init(row: Int, column: Int) {
        self.rows = row
        self.columns = column
        self.grid = Array(repeating: 0.0, count: row * column)
    }
    
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows &&
            column >= 0 && column < columns
    }
    
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index is out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}

// t
var matrix = Matrix(row: 2, column: 2)

matrix[0,0] = 3.2
matrix[0,1] = 1.1
matrix[1,0] = 4.5
matrix[1,1] = 1.3


let fiveMultiplier = TimeTable.init(6)
print("6 * 3 = \(fiveMultiplier[3])")



class Vehicle {
    /*final*/ var currentSpeed = 0.0
    let someTestValue = 8
    var description: String {
        get {
            return "traveling at \(currentSpeed) miles per hour"
        }
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

let vehicleInstanc = Vehicle()
print(vehicleInstanc.description)

// Subclassing

class Bicycle : Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle() //

bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")


class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

class Train: Vehicle {
    override func makeNoise() {
        print("Cho-cho!")
    }
}

let train = Train()
train.makeNoise()

// Overriding Properties

class Car : Vehicle {
    var gear = 1
    
    
    
    override var description: String {
        return super.description + "in gear \(self.gear)"
    }
}

let car = Car()
car.gear = 5
car.currentSpeed = 60.0
print(car.description)

// Overiding property observers

class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
        willSet {
            //: call before value changed
        }
    }
}

let porsche = AutomaticCar()
porsche.currentSpeed = 30
print("Gear is \(porsche.gear)")




		
