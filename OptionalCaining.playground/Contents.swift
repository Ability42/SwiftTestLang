//: Optional Chaining as an Alternative to Forced Unwrapping


//: Defining Model Classes for Optional Chaining

class Person {
    var residence: Residence?
}

class Residence {
    
    var rooms = [Room]()
    var adress: Adress?
    
    var numberOfRooms: Int {
        return rooms.count
    }
    
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    
    func printNumeberOfRooms() {
        print("There are \(numberOfRooms) rooms")
    }
}

class Room {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Adress {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    
    func buildingIdentifier() -> String? {
        if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
    /*
    init(buildingName: String?, buildingNumber: String?, street: String?) {
        self.buildingName = buildingName
        self.buildingNumber = buildingNumber
        self.street = street
    }
    */
}


let john = Person()
// john.residence = Residence()

if let roomCount = john.residence?.numberOfRooms {
    print("There are \(roomCount) rooms")
} else {
    print("There are no rooms")
}

func createAdress() -> Adress {
    print("createAdress() is called")
    
    let someAdress = Adress()
    someAdress.buildingNumber = "5"
    someAdress.street = "Lukasha"
    
    return someAdress
}

john.residence?.adress = createAdress()

if john.residence?.printNumeberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

//: Accessing Subscripts Through Optional Chaining

john.residence?[0] = Room(name: "Kitchen")
// This subscript setting attempt also fails, because residence is currently nil.

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}


let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "kitchen"))
johnsHouse.rooms.append(Room(name: "livingroom"))

john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName).")
} else {
    print("Unable to retrieve the first room name.")
}
// Prints "The first room name is Living Room."


//: Accessing Subscripts of Optional Type

var testScores = ["Dave": [22,11,33], "Steve": [43,12,44]]
testScores["Dave"]?[0] = 11
testScores["Bev"]?[0] += 1
print(testScores["Dave"]!)


//: Linking Multiple Levels of Chaining


if let johnsStreet = john.residence?.adress?.street { // There are two levels of optional chaining
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}

let johnsAdress = Adress()

johnsAdress.buildingName = "Burj Khalifa"
johnsAdress.street = "Lukasha st."
john.residence?.adress = johnsAdress

if let johnsStreet = john.residence?.adress?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}


//: Chaining on Methods with Optional Return Values


if let buildingID = john.residence?.adress?.buildingIdentifier() {
    print("Building ID is \(buildingID)")
}

if let beginsWithBurj = john.residence?.adress?.buildingIdentifier()?.hasPrefix("Burj") {
    if beginsWithBurj  {
        print("John's building identifier begins with \"Burj\".")
    } else {
        print("John's building identifier does not begin with \"Burj\".")
    }
}










