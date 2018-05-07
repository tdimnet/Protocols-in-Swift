// A protocol only describes an implementation
protocol FullNameable {
    var fullName: String { get }
}


//struct User: FullNameable {
//    var fullName: String
//}
//
//let user = User(fullName: "John Smith")

struct Friend: FullNameable {
    let firstName: String
    let middleName: String
    let lastName: String
    
    var fullName: String {
        return "\(firstName) \(middleName) \(lastName)"
    }
}

let friend = Friend(firstName: "Thomas", middleName: "Stephane", lastName: "Dimnet")
friend.fullName


// Bad example using struct and class -> not ideal for all use cases
import Foundation

enum EmployeeType {
    case manager
    case traditional
}

protocol Payable {
    func pay() -> Paycheck
}

struct Paycheck {
    let base: Double
    let benefits: Double
    let deductions: Double
    let vacation: Double
}

class Employee {
    let name: String
    let address: String
    let startDate: Date
    let type: EmployeeType
    
    init(name: String, address: String, startDate: Date, type: EmployeeType) {
        self.name = name
        self.address = address
        self.startDate = startDate
        self.type = type
    }
}

class HourlyEmployee: Employee, Payable {
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.0
    let vacation: Double = 0.0
    
    func pay() -> Paycheck {
        let base = hoursWorked * hourlyWage
        return Paycheck(base: base, benefits: 0, deductions: 0, vacation: 0)
    }
}

class SalariedEmployee: Employee, Payable {
    var salary: Double = 50000.00
    var benefits: Double = 1000.00
    var deductions: Double = 0.0
    var vacation: Double = 2.0
    
    func pay() -> Paycheck {
        let montly = salary / 12
        return Paycheck(base: montly, benefits: benefits, deductions: deductions, vacation: vacation)
    }
}

func pay(employee: Payable) {
    employee.pay()
}

let employee: SalariedEmployee = SalariedEmployee(name: "Thomas", address: "someAddress", startDate: Date(), type: EmployeeType.traditional)
let anotherEmployee: HourlyEmployee = HourlyEmployee(name: "Marc", address: "someAddress", startDate: Date(), type: EmployeeType.traditional)
employee.pay()
anotherEmployee.pay()


// Loosely Related Types
protocol Blendable {
    func blend()
}

class Fruit: Blendable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func blend() {
        print("I'm mush!")
    }
}

class Dairy {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Cheese: Dairy {}

class Milk: Dairy, Blendable {
    func blend() {
        print("I haven't change at all! I'm still milk")
    }
}

func makeSmoothie(with ingredients: [Blendable]) {
    for ingredient in ingredients {
        ingredient.blend()
    }
}

let strawberry: Fruit = Fruit(name: "Strawberry")
let cheddar: Cheese = Cheese(name: "Cheddar")
let chocolateMilk: Milk = Milk(name: "Chocolate")

let ingredients: [Blendable] = [strawberry, chocolateMilk] // -> if I use cheddar, it would raise an error since it is now a Blendable type
makeSmoothie(with: ingredients)

// Random Number Generator
protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
        return lastRandom/m
    }
}

class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
d6.roll()


// Protocol Inheritance
protocol Printable {
    func description() -> String
}

protocol PrettyPrintable: Printable {
    func prettyDescription() -> String
}

struct User: PrettyPrintable, Equatable {
    let name: String
    let age: Int
    let address: String
    
    func description() -> String {
        return "\(name), \(age), \(address)"
    }
    
    func prettyDescription() -> String {
        return "name: \(name)\nage: \(age)\naddress: \(address)"
    }
    
    static func ==(lhs: User, rhs: User) -> Bool {
        return lhs.name == rhs.name && lhs.age == rhs.age && lhs.address == rhs.address
    }
}

let user = User(name: "Thomas", age: 29, address: "someAddress")
print(user.prettyDescription())

let anotherUser = User(name: "Thomas", age: 29, address: "someAddress")

user == anotherUser

















