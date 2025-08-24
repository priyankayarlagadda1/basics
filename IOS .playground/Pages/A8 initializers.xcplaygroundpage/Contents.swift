//: [Previous](@previous)

import Foundation

//Create a Book struct with a custom initializer that sets a default "Unknown" author if none is provided.
struct Book {
    var title: String
    var author: String
    
    init(title: String, author: String = "Unknown") {
        self.title = title
        self.author = author
    }
}
let book1 = Book(title: "Secret History", author: "George Orwell")
let book2 = Book(title: "Some Untitled Book")
print(book1)

//Build a Circle struct with two initializers: one for radius, another for diameter (delegating to radius).
struct Circle {
    var radius: Double
    
    init (radius:Double){
        self.radius = radius
    }
    init (diameter:Double){
        self.init(radius:diameter/2)
    }
}
let circle1 = Circle(radius: 5.0)
let circle2 = Circle(diameter: 10.0)
print(circle2)

//Create a failable initializer for an Email struct that returns nil if the string doesn’t contain "@".
struct Email {
    var localPart: String
    var domain: String
    
    init?(emailString: String) {
        let parts = emailString.split(separator: "@")
        guard parts.count == 2 else { return nil }
        self.localPart = String(parts[0])
        self.domain = String(parts[1])
    }
}
let email1: Email? = Email(emailString: "joe@example.com")
let email2: Email? = Email(emailString: "joe")
print(email2)

//Make a Car class that has a designated initializer (brand, doors) and a convenience initializer (brand) that defaults doors to 4.

class Car {
    var brand: String
    var doors: Int

    // Designated initializer
    init(brand: String, doors: Int) {
        self.brand = brand
        self.doors = doors
    }

    // Convenience initializer (defaults doors to 4)
    convenience init(brand: String) {
        self.init(brand: brand, doors: 4)
    }
}
let car1 = Car(brand: "Toyota", doors: 2)
let car2 = Car(brand: "Honda")

print(car1.doors)
print(car2.doors)

//Define a base class Shape with a required init(sides:) and implement it in a subclass Triangle.
class Shape {
    var sides: Int
    
    required init(sides: Int) {
        self.sides = sides
    }
}
class Trinagle: Shape {
    required init(sides: Int) {
        super.init(sides: sides)
    }
}
let triangle = Trinagle(sides: 3)
print(triangle.sides)


//error handiling
//Write a function sqrt(of:) throws that throws an error if input is negative.
func sqrt(of number: Double) throws -> Double {
    guard number >= 0 else {
        throw NSError(domain: "MathErrorDomain", code: 1001, userInfo: [NSLocalizedDescriptionKey : "Square root of a negative number is not defined."])
    }
    return Foundation.sqrt(number)
}
var result: Double!
do {
    result = try sqrt(of: -9.0)
} catch {
    print("Error: \(error.localizedDescription)")
}
//Demonstrate do/try/catch by handling both safe and error cases of your functions.
enum DivisionError :Error{
    case divideByZeroError
    case otherError
}
func division(num:Double, deno:Double) throws -> Double{
    guard deno != 0 else{
        throw DivisionError.divideByZeroError
    }
    return num / deno
    do{
        let res = try division(num: 12, deno: 0)
        print(res)
    }catch let error{
        print(error.localizedDescription)
    }
}

//Use try? with a throwing function to return an optional result safely.
func optionalDivision(num:Double, deno:Double) -> Double?{
    do{
        return try division(num: num, deno: deno)
    }catch{
        return nil
    }
}
let optionalRes = optionalDivision(num: 10, deno: 2)
print(optionalRes ?? 0)

// Create a NetworkError enum and a fetchData(from:) throws function that validates a URL and simulates "Data from URL" or throws errors.

enum NetworkError: Error {
    case invalidURL
    case clientError
    case serverError
    case unknownError
}

// A function that "pretends" to fetch data from the internet
func fetchData(from url: URL) throws -> String {
    let urlString = url.absoluteString

    // Simulate error conditions
    if urlString.isEmpty {
        throw NetworkError.invalidURL
    } else if urlString.contains("client") {
        throw NetworkError.clientError
    } else if urlString.contains("server") {
        throw NetworkError.serverError
    } else if urlString.contains("fail") {
        throw NetworkError.unknownError
    }

    // If no errors, return fake data
    return "Data from \(urlString)"
}

// Try it out with a sample URL
let input = "https://www.example.com"

if let url = URL(string: input) {
    do {
        let result = try fetchData(from: url)
        print("Success:", result)
    } catch NetworkError.invalidURL {
        print("Invalid URL")
    } catch NetworkError.clientError {
        print("Client error (e.g., 400)")
    } catch NetworkError.serverError {
        print("Server error (e.g., 500)")
    } catch {
        print("Unknown error occurred")
    }
} else {
    print("Couldn't create URL from string")
}
