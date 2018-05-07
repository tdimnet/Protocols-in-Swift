// A protocol only describes an implementation
protocol FullNameable {
    var fullName: String { get }
}


struct User: FullNameable {
    var fullName: String
}

let user = User(fullName: "John Smith")

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


























