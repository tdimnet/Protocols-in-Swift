// 1.
/*
 Declare a protocol named User. The protocol defines two requirements: a gettable property named name of type String, and a gettable/settable property named age of type Int
 Hint: To declare a property as gettable, add { get } after the type. For settable - { set } and combine both to get a gettable and settable property.
 */

protocol User {
    var name: String { get }
    var age: Int { get set }
}

// 2.
/*
 In the editor the protocol you created, User, is provided along with an empty struct. For this task, Person needs to conform to User.
 After you've written code to achieve this task, create an instance of Person and assign it to a constant named somePerson.
 */

struct Person: User {
    var name: String
    var age: Int
}

let somePerson: Person = Person(name: "Thomas", age: 29)
