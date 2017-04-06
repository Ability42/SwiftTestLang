//: Playground - noun: a place where people can play

func makeIncrementor(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    
    func incrementer() -> Int {
        
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementor(forIncrement: 10)
let incrementByTwo = makeIncrementor(forIncrement: 2)

incrementByTwo()
incrementByTwo()

let alsoIncrementedByTwo = incrementByTwo
alsoIncrementedByTwo()


func makeIncremented(forIncrementer amount: Int) -> (Int) -> (Int) {
    var total = 0
    func incrementerMultiple(arg x: Int) -> (Int) {
        total += amount + x
        return total
    }
    return incrementerMultiple
}


let incrementer = 3

let byThree = makeIncremented(forIncrementer: incrementer)

byThree(2) // pass extra incrementer (2)
byThree(4)


let alsoByThree = byThree
alsoByThree(2)
