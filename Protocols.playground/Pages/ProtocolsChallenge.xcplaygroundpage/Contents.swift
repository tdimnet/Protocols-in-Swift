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



// 3.
/*
 In the editor below, I've declared a class, WifiLamp, that represents an interface to one of those Internet of Things lamps. The class models state that determines whether the lamp is on or off and a color, represented by the Color enum.
 For the first step, declare a protocol named ColorSwitchable. The protocol has a single requirement: a method named switchColor that takes a value of Color as an argument. For the sake of this challenge, make sure your external argument label is omitted by using an underscore. Give the argument a local name of color.
 */
protocol ColorSwitchable {
    func switchColor(_ color: Color)
}

enum LightState {
    case on, off
}

enum Color {
    case rgb(Double, Double, Double, Double)
    case hsb(Double, Double, Double, Double)
}

class WifiLamp: ColorSwitchable {
    let state: LightState
    var color: Color
    
    init() {
        self.state = .on
        self.color = .rgb(0,0,0,0)
    }
    
    func switchColor(_ color: Color) {
        self.color = color
    }
}
