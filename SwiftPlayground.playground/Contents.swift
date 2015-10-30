let a: String? = nil;
let b: String = "Ani";
let c = "Hello \(a ?? b)";
print(c);

// switch
let vegetable = "bean";
switch vegetable {
case "tomato":
    print("Yeah! It's tomato");
case "bean":
    print("Ooh! I hate bean");
case let i where i.hasSuffix("Potato"):
    print("Ha, I got you \(i)");
default:
    print("Nothing get");
}

// for-in
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]
];
var largest = 0;
for (type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number;
        }
    }
}
print(largest);

// range
var loopNumber = 0;
for i in 0 ..< 5 {
    loopNumber += i;
}
print(loopNumber);

var loopNumber2 = 0;
for var i = 0; i < 5; ++i {
    loopNumber2 += i;
}
print(loopNumber2);


// function
func greet(name: String, time: String) -> String {
    return "Hi \(name), it's \(time) now";
}
var alo = greet("Ani", time: "10:30");

// function more arguments
func sum(number: Int...) -> Int {
    var sum = 0;
    for num in number {
        sum += num;
    }
    return sum;
}
var total = sum(1, 2, 9);
print(total);

// function for condition
func getPrime(numbers: [Int], condition: (Int) -> Bool) -> [Int] {
    var list = [Int]();
    for number in numbers {
        if condition(number) {
            list.append(number);
        }
    }
    return list;
}

func prime(num: Int) -> Bool {
    var result: Bool = false;
    if num == 1 {
        result = true;
    } else {
//        for var i = 1; i <= num/2; ++i {
        for i in 1...num/2 {
            if num % i == 0 && i != 1 {
                result = false;
            } else {
                result = true;
            }
        }
    }
    return result;
}

getPrime([1, 2, 3, 4, 5, 6, 17], condition: prime);

//return a function
func makeIncrement() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return number + 1;
    }
    return addOne;
}

var increment = makeIncrement();
increment(16);

// closure function
var numbers = [5, 2, 7, 3]
numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})

let mappedNumbers = numbers.map({
    number in number * 3
})

let sortedNumber = numbers.sort {
    $0 > $1
}

// Class
class Shape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
    func simpleDiscreption() -> String {
        return "\(name) with \(numberOfSides) sides."
    }
}
var shape = Shape(name: "Triangle")
shape.numberOfSides = 3
shape.simpleDiscreption()

// Subclass
class Square: Shape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    func area() -> Double {
        return sideLength * sideLength
    }
    override func simpleDiscreption() -> String {
        return "A square with sides of length \(sideLength)"
    }
}
var square = Square(sideLength: 5.2, name: "Square")
square.area()
square.simpleDiscreption()

class Triangle: Shape {
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
    
    override func simpleDiscreption() -> String {
        return "An equilateral triangle with sides of length \(sideLength)"
    }
}

var triangle = Triangle(sideLength: 3.1, name: "triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)
triangle.simpleDiscreption()

// function willSet
class TriangleAndSquare {
    var triangle: Triangle {
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
        triangle = Triangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger shape")
print(triangleAndSquare.triangle.sideLength)


let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional shape")
let sideLength = optionalSquare?.sideLength

// Enum
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDiscription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 13) {
    let threeDescription = convertedRank.simpleDiscription()
}


enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDesciption() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}

let hearts = Suit.Hearts
let heartDesciption = hearts.simpleDesciption()

// Struct
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDiscription()) of \(suit.simpleDesciption())"
    }
}

let sevenOfHearts = Card(rank: .Seven, suit: .Hearts)
let sevenOfHeartsDescription = sevenOfHearts.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00", "20:00")
let failure = ServerResponse.Error("Out of cheese")

switch success {
case let .Result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .Error(error):
    print("Failure... \(error)")
}

// Protocol and Extensions
protocol ExampleProtocol {
    var simpleDescription: String {
        get
    }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 1024
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var simpleClass = SimpleClass()
simpleClass.adjust()
let aDescription = simpleClass.simpleDescription

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
var simpleStruct = SimpleStruct()
simpleStruct.adjust()
let bDescription = simpleStruct.simpleDescription

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 27
    }
}
print(7.simpleDescription)

let protocolValue: ExampleProtocol = simpleClass
print(protocolValue.simpleDescription)

// Generic function
func repeatItem<Item>(item: Item, numberOfTime: Int) -> [Item] {
    var result = [Item]()
    for _ in 0 ..< numberOfTime {
        result.append(item)
    }
    return result
}
repeatItem(7, numberOfTime: 4)

enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)

func anyCommonElements <T: SequenceType, U: SequenceType where T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element> (lhs: T, _ rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])


// Chapter 2
// some practise
var hello = "Bonjour"
print("The current value of hello is \(hello)")

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0


let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

//let cannotBeNegative: UInt8 = -1
//UInt8 cannot store negative numbers, and so this will report an error

//let tooBig: Int8 = Int8.max + 1
//Int8 cannot store a number larger than its maximum value,
//and so this will also report an error

let uint16: UInt16 = UInt16.max

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

