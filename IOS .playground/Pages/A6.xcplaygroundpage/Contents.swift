//: [Previous](@previous)
import Foundation //must include
// closure
//func multiplyClosure(number1: Int , number2: Int) -> () {
    //let result = 3 * 2
//}
//print(multiplyClosure(number1:8, number2:7))
//1.
func multiplyClosure(number1: Int, number2: Int) -> Int {
    return number1 * number2
}
let result = multiplyClosure(number1: 3, number2: 2)
print(result)
//2.
func makeCounter() -> () -> Int {
    var count = 0
    return {
        count += 1
        return count
    }
}
let counter1 = makeCounter()
print(counter1())
print(counter1())
//3.
func performLater(_ action: @escaping @Sendable () -> Void) {
    // let Action = action
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        action()
    }
}
performLater{
    print( "Hello, World!" )
}
//4.
func retry(times: Int, action: @escaping () -> Bool) {
    var attempt = 1
    
    while attempt <= times {
        print("Attempt #\(attempt)")
        
        if action() {
            print("Success on attempt \(attempt)")
            return
        }
        
        attempt += 1
    }
    
    print("Failed after \(times) attempts")
}

var count = 0

retry(times: 5) {
    count += 1
    return count == 4
}
