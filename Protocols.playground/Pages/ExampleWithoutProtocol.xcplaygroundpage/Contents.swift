import Foundation

enum EmployeeType {
    case manager
    case traditional
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
    
    func pay() -> Paycheck {
        return Paycheck(base: 0, benefits: 0, deductions: 0, vacation: 0)
    }
}

class HourlyEmployee: Employee {
    var hourlyWage: Double = 15.00
    var hoursWorked: Double = 0.0
    let vacation: Double = 0
    
    override func pay() -> Paycheck {
        let base = hourlyWage * hoursWorked
        return Paycheck(base: base, benefits: 0, deductions: 0, vacation: 0)
    }
}

class SalariedEmployee: Employee {
    var salary: Double = 50000.00
    var benefits: Double = 1000.00
    var deductions: Double = 0.0
    var vacation: Double = 2
}


func pay(employee: Employee) {
    employee.pay()
}
