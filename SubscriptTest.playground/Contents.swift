//: Playground - noun: a place where people can play

import UIKit

struct TimesTable {
    var multiplier: Int
    
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let twoTimesTable = TimesTable(multiplier: 2)
twoTimesTable[1]
twoTimesTable[2]


struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            print((row * column) + column)
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}


var someTable = Matrix(rows: 3, columns: 3)


someTable[0,2] = 32
someTable[1,1] = 42


let id_1 = someTable[0,2]
let id_2 = someTable[1,1]

someTable[0,2]


//: Type Casting

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: artist)
    }
}


let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

/* Checking type */

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    }
    if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")


/* Downcasting */
// as! - when sure
// as? - when don't sure


for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}


//: Any & ANyObject

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)" })



let optionalNumber: Int? = 3

things.append(optionalNumber as Any)




		