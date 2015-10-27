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
