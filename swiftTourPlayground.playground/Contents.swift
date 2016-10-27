//: Playground - noun: a place where people can play

import UIKit

print("Hello, world!")

var myVariable = 42

myVariable = 50

let myConstant = 42

//“let to make a constant and var to make a variable”
//“A constant or variable must have the same type as the value you want to assign to it”

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

// EXPERIMENT
let explicitFloat: Float = 4.0

// EXPERIMENT
let label = "The width is"
let width = 94
let widthLabel = label


let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."


let work: Float = 2.5
let internship: Float = 1.5
let experience = "I have \(work) years of working experience."
let totalExperience = "Grace has a total of \(internship + work) years of experience in the industry."



let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)


// EXPERIMENT
var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Good day, John"
}


// EXPERIMENT
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default : break
    
}


// EXPERIMENT

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest :Int = Int.min
var type :String? = nil
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number >= largest {
            type = kind
            largest = number
        }
    }
}


print(largest)
print(type!)



var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)



// EXPERIMENT
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)
print(sumOf(numbers: 42, 597, 12))

func averageOf(numbers: Int...) -> Double {
    var sum = 0
    for number in numbers {
        sum += number
    }
    let average = Double(sum) / Double(numbers.count)
    return average
}
averageOf()
averageOf(numbers: 89, 69, 30, 20)


// EXPERIMENT
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

print(
    numbers.map(
        {
            (number: Int) -> Int in
            if (number % 2 == 0) {
                return number
            }
            return 0
        }
        )
)

//func test(number: Int) -> Bool {
//    print("test \(number)")
//    return number < 10
//}
//
//var res : String? = nil
//var a = 4
//if (a % 2 == 0 || test(number:a)) {
//    res = "even"
//} else {
//    res = "odd"
//}
//print(res)



// EXPERIMENT
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
        }
    let numberOfAngles = 0
    func additionDescription() -> String {
        return " A shape with \(numberOfAngles) angles has same number of sides."
    }
    
}


// EXPERIMENT
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

//“Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.”

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 0
    }
    
    func area() ->  Double {
        return radius * radius * 3.14
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)."
    }
}
let test = Circle(radius: 10, name: "my test circle")
test.area()
test.simpleDescription()


class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)



// EXPERIMENT
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue

if (Rank.ace.rawValue == Rank.king.rawValue) {
    print("equal")
} else {
    print("not equal")
}


//func comp(val1: Rank, val2: Rank) -> Bool {
//    return val1.rawValue == val2.rawValue
//}
//
//print(comp(val1: Rank.ace, val2: Rank.king))


if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .diamonds, .hearts:
            return "red"
        }
        
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()


struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()




//class PersonClass {
//    public var name: String?
//}
//
//struct PersonStruct {
//    public var name: String?
//}
//
//func updateName(pc : PersonClass, ps : PersonStruct) {
//    pc.name = "Kristian"
//}
//
//var p1 : PersonClass = PersonClass()
//var p2 : PersonStruct = PersonStruct()
//p1.name = "Eunice"
//p2.name = "Eunice"
//
//updateName(pc: p1, ps: p2)
//print(p1.name)
//print(p2.name)


