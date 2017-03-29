//: Playground - noun: a place where people can play


/// return an index of fibonachi number
/// number passes as 'of number' parameter
func fibonachi(of number: Int) -> Int {
    if number < 2 {
        return number
    } else {
        return fibonachi(of: number - 1) + fibonachi(of: number - 2)
    }
}

//fibonachi(of: 4)

struct Person {
    var age = 6
    
    lazy var fibonachiAge: Int = {
        return fibonachi(of: self.age)
    }()
}

var singer = Person()
singer.fibonachiAge
		