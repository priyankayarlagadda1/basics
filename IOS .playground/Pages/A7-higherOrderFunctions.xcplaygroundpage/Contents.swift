import Foundation
//Use map to convert an array of Celsius temps to Fahrenheit.
let celsiusArr = [100, 60, 40, 20, 0]
var fahrenheitArr: [Int] = []

for celsius in celsiusArr {
    let fahrenheit = (celsius * 9/5) + 32
    fahrenheitArr.append(fahrenheit)
}

print(fahrenheitArr)

//mapFucntion
let fahrenheitArr2 = celsiusArr.map ({$0 * 9/5 + 32})
    print(fahrenheitArr2)

//filter
//Use filter to extract all odd numbers from [1...20].
let numberArr: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
 if numberArr == numberArr.filter({$0 % 2 == 0}) {
     print("All even numbers")
}
print(numberArr.filter({$0 % 2 != 0}))
//reduce
//Use reduce to multiply all numbers in [1,2,3,4].
let nos = [1, 2, 3, 4]
let mul = nos.reduce(1, *)
let sum = nos.reduce(1, +)
let minus = nos.reduce(1, -)
print(mul)
//sort
//Use sorted to arrange names alphabetically.
var names: [String] = ["raj", "Bavi", "priya", "sai", "riya"]
let sortNames = names.sorted()
print(sortNames)
//flatMap
//Given a list of sentences, use flatMap to break them into words.
let sentence:[String] = [
    "IF clouds had souls it would never stop raining",
    "In older Swift versions, flatMap was also used to unwrap optional values within a collection, but this behavior has changed in Swift 5"
]
let words = sentence.flatMap ({$0.split(separator: " ")})
print(words)
//generics
//Create Stack for String using Genrics
struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        return items.popLast()
    }

    func displayStackItems() {
        print(items)
    }
}

// Usage with String
var stringStack = Stack<String>()
stringStack.push(item: "Swift")
stringStack.push(item: "Generics")
stringStack.displayStackItems()
stringStack.pop()
stringStack.displayStackItems()
// maxValue
//Write a generic function maxValue<T: Comparable>( a: T,  b: T) -> T.
func maxValue <T: Comparable>(_ a: T, _ b: T) -> T {
    return a > b ? a : b
}
print (maxValue(10, 20))

//Create a generic Queue<T> type with enqueue and dequeue.
struct Queue<T> {
    private var items: [T] = []
    
    mutating func enqueue(item: T) {
        items.append(item)
    }
    
    mutating func dequeue() -> T? {
        return items.removeFirst()
    }
}
var intQueue = Queue<Int>()
intQueue.enqueue(item: 1)
intQueue.enqueue(item: 2)
print(intQueue)
intQueue.dequeue()
print(intQueue)

//Write a generic function to reverse any array.
func reverseArray<T> (array: inout [T]) {
    return array.reverse()
    
}
let array1: [Int] = [1, 2, 3, 4, 5]
var array2: [Int] = array1
reverseArray(array: &array2)
print(array2)

//Show use of Genrics for enum
enum Shape<T> {
    case circle(T)
    case square(T)
    case triangle(T)
}
switch shape {
case .circle(let value):
    print("Circle with value \(value)")
case .square(let value):
    print("Square with value \(value)")
case .triangle(let value):
    print("Triangle with value \(value)")
}
let shape = Shape<Int>.square(5)
print(shape)
//Show use of Genrics for Class
class GenericStack<T> {
    private var items: [T] = []
    
    init(items: [T]) {
        self.items = items
    }
    
    func push(item: T) {
        items.append(item)
    }
    
    func pop() -> T? {
        return items.popLast()
    }
    func displayInfo() {
            print("items: \(items)")
        }
}
var genericStack = GenericStack<Int>(items: [])
genericStack.push(item: 1)
genericStack.push(item: 2)
genericStack.push(item: 3)
genericStack.push(item: 4)
print(genericStack)
genericStack.pop()
print(genericStack)
genericStack.displayInfo()

// same with Queue

class Information<T>
{
    var name: String
    var age: Int
    var email: String
    
    init(name: String, age: Int, email: String)
    {
        self.name = name
        self.age = age
        self.email = email
    }
    func displayInfo() {
            print("Name: \(name), Age: \(age), Email: \(email)")
        }
}
var InfoInformation: [Information<String>] = []
InfoInformation.append(Information(name: "Shahriar", age: 21, email: "shahriar@gmail.com"))
let firstInfo: Information<String> = InfoInformation[0]
firstInfo.displayInfo()

//Define a protocol QueueProtocol with an associated type Element.
protocol QueueProtocol {
    associatedtype Element
    mutating func enqueue(_ item: Element)
    mutating func dequeue() -> Element?
    func displayQueue() -> [Element]
}
var queue: [Int] = []
extension Array: QueueProtocol where Element == Int {
    mutating func enqueue(_ item: Int) {
        append(item)
    }
    mutating func dequeue() -> Int? {
        guard !isEmpty else { return nil }
        return removeFirst()
    }
    func displayQueue() -> [Int] {
        return self
    }
}
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
print(queue.displayQueue())
queue.dequeue()
print(queue.displayQueue())

//Implement IntQueue and StringQueue.
//Protocol with Associated Type
protocol Conatiner {
    associatedtype Element
    mutating func addElements(_ element: Element)
    mutating func removeElement() -> Element?
}
//IntQueue Implementation

struct IntQueue<T>: Conatiner {
    typealias Element = T
    private var items: [T] = []

    mutating func addElements(_ element: T) {
        items.append(element)
    }

    mutating func removeElement() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }

    func displayQueue() -> [T] {
        return items
    }
}
var newQueue = IntQueue<Int>()
newQueue.addElements(10)
newQueue.addElements(20)
print(newQueue.displayQueue())
newQueue.removeElement()
print(newQueue.displayQueue())

// StringQueue Implementation
struct StringQueue: Conatiner {
    typealias Element = String
    private var items: [String] = []
    
    mutating func addElements(_ element: String) {
        items.append(element)
    }
    
    mutating func removeElement() -> String? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    
    func displayQueue() -> [String] {
        return items
    }
}

// StringQueue
var stringQueue = StringQueue()
stringQueue.addElements("Apple")
stringQueue.addElements("Banana")
stringQueue.addElements("Cherry")
print("StringQueue:", stringQueue.displayQueue())
stringQueue.removeElement()
print("After removal:", stringQueue.displayQueue())


