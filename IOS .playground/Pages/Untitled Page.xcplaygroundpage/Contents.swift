// AS 5


// Properties
// Stored property
struct GamerProfile {
    var name: String
    var score: Int
    var level: Int
}
var gamer = GamerProfile(name: "RM", score: 100, level: 1)
print("player: \(gamer.name), level: \(gamer.level), score: \(gamer.score)")

// computed property

//calculating a cars fuel efficiency rating

struct Car {
    var fuelEfficiency: Double
    var tankCapacity: Double
    
    var mpg: Double {
        tankCapacity == 0 ? 0 : 1000 / fuelEfficiency
    }
    var fualEfficiencyRating: String {
        mpg < 25 ? "Bad" : mpg < 50 ? "Fair" : "Good"
    }
}
let car = Car(fuelEfficiency: 25.0, tankCapacity: 12.0)
print("Fuel efficiency rating: \(car.fualEfficiencyRating)")

// Lazy property
struct Example {
    lazy var value: Int = {
        print("Calculating value...")
        return 42
    }()
    
}
var ex = Example()
print("Befor Access")
print(ex.value)
print(ex.value)
//Entensions

extension Int {
    func isEven() -> Bool {
        return self % 2 == 0
    }
}
print(Bool.self)
let number = 10

if number.isEven() {
    print("\(number) is even")
} else {
    print("\(number) is odd")
}
//Protocols

import Foundation

// 1.

protocol Playable {
    func play()
}

struct Music: Playable {
    func play() {
        print("Playing music")
    }
}

struct Video: Playable {
    func play() {
        print("Playing video")
    }
}

// 2.

protocol Shape {
    func area() -> Double
}

struct Circle: Shape {
    var radius: Double

    func area() -> Double {
        return .pi * radius * radius
    }
}

struct Rectangle: Shape {
    var width: Double
    var height: Double

    func area() -> Double {
        return width * height
    }
}

// 3.

protocol Cacheable {
    associatedtype ValueType
    func save(key: String, value: ValueType)
    func load(key: String) -> ValueType?
}

class MemoryCache<T>: Cacheable {
    private var storage: [String: T] = [:]

    func save(key: String, value: T) {
        storage[key] = value
    }

    func load(key: String) -> T? {
        return storage[key]
    }
}

// 4.

protocol Greetable {
    var name: String { get }
    func sayHi()
}

extension Greetable {
    func sayHi() {
        print("Hi, I'm \(name)!")
    }
}

struct Person: Greetable {
    let name: String
}

// IMP

// Call everything here to produce output
func runExamples() {
    print("Playable")
    let song = Music()
    let movie = Video()
    song.play()
    movie.play()

    print("Shapes")
    let circle = Circle(radius: 5)
    let rectangle = Rectangle(width: 4, height: 3)
    print("Circle area: \(circle.area())")
    print("Rectangle area: \(rectangle.area())")

    print("Cacheable")
    let stringCache = MemoryCache<String>()
    stringCache.save(key: "username", value: "john_doe")
    print("Loaded from cache: \(stringCache.load(key: "username") ?? "Not found")")

    print("Greetable")
    let person = Person(name: "Alice")
    person.sayHi()
}
runExamples()
