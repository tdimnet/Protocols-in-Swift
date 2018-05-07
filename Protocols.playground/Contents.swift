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




































