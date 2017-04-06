/*
let names = ["Me", "You", "We", "They", "She"]

// 1
func backwards(_ xs1: String, _ xs2: String) -> Bool {
    return xs1 > xs2
}
let reversedNames = names.sorted(by: backwards)

// 2
let reversedNames_2 = names.sorted(by: { (s1, s2) in
    return s1 < s2
})


// 4
let reversedNames_shortForm = names.sorted { $0 < $1 }

// 5
let yetSimplerClosure = names.sorted(by: <)

names.sorted { (xs1, xs2) -> Bool in
    return xs1 < xs2
}
*/

// Trailing Closures

let digitNames = [
    0: "9", 1: "8", 2: "7", 3: "6", 4: "5",
    5: "4", 6: "3", 7: "2", 8: "1", 9: "0"
]
let numbers = [4, 12, 100]



let strings = numbers.map {
    (number) -> String in // block(closure) that execute in outside func.
    var number = number
    var output = ""     // String init
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    print(output)
    return output // Returned <String> type
}



// Escaping closures
var completionHandlers: [() -> Void] = [] // Array of closures(empty now)


// @escaping
// Marking a closure with @escaping means you have to refer to self explicitly within the closure
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
// @nonescaping
func someFunctionWithNonEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething()  {
        someFunctionWithEscapingClosure {
            self.x = 0
        }
        someFunctionWithNonEscapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.x
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)

/*** Autoclosures ***/

var customerInLine = ["Bob", "Michel", "Steve", "Andy", "Sergio"];


func serve(customer provider:  () -> Any) {
    print("Serving \(provider())")
}

serve { () -> Any in
    customerInLine.remove(at: 0)
}
serve(customer: { customerInLine.remove(at: 0) })


func serveWithAutoClosure(customer provider: @autoclosure () -> Any) {
    print("Serving \(provider())")
}
//
serveWithAutoClosure(customer: customerInLine.remove(at: 0))


var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider:@autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}

collectCustomerProviders( customerInLine.remove(at: 0) )
collectCustomerProviders( customerInLine.remove(at: 0) )


for customer in customerProviders {
    print("Now serving \(customer())")
}






