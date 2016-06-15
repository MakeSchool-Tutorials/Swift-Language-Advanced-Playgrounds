import Foundation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true


/*:
 # Closures
 Closures are blocks of code that can be passed around and used in your code. You can think of them as functions that don't have a name. You can store closures as a variable or pass them as a parameter to a function. Closures are useful because sometimes you want to write function-like code without writing out the full syntax for a function. You'll learn how and when to use closures in this playground.
 ## Declaration
 A `closure` expression has the following syntax:
 
 { (parameters) -> returnType in
 statements
 }
 You can assign a closure to a variable:
 */
let reverseStringSort = { (stringA: String, stringB: String) -> Bool in
    return stringA > stringB
}
/*:
 Or pass them as a parameter to a function:
 */
let names = ["Arya", "Sansa", "Jon"]
names.sort(reverseStringSort)
/*:
 In this example, we pass our closure varible `reverseStringSort` as a parameter to the `sort` function to tell it how to sort the `names` array. You can also pass a closure directly to a function:
 */
names.sort({ (stringA: String, stringB: String) -> Bool in
    return stringA > stringB
})
/*:
 This time we passed a closure directly as a parameter to the `sort` function. If you don't quite understand what just happened, that's okay. We'll have plenty of more practice for you below.
 ## "Close Over"
 Closures get their name because they "close over" variables and constants in their scope. This means closures can use and manipulate variables and constants in their surrounding context.
 */
var secretMessage = ""
let addToSecret = { (newMessage: String) -> String in
    secretMessage += " \(newMessage)"
    return secretMessage
}

addToSecret("Winter")
addToSecret("is")
addToSecret("coming")
/*:
 Here we can see that the closure `addToSecret` can use and manipulate the varible `secretMessage`.
 
 ## When To Use Closures
 Closures are most commonly used in the following cases:
 1. Completion handlers, or when you want to execute a block of code after an action has occurred (i.e. network request, user takes an action)
 2. When you want to pass a function as a parameter to another function
 ## TODO: Closure Examples
 */
class ShowWeather  {
    
    func displayWeatherDetails() {
        WeatherService.getWeather({ (detail) in
            print(detail)
        })
    }
}

let weather = ShowWeather()
weather.displayWeatherDetails()

/*:
 ## TODO: Challenges
 */

/*:
 ## Advanced: Shorthand Syntax
 Closures are meant to be short. There are many special tricks swift has to shorten it's syntax.
 ### Implicit Returns from Single-Expression Closures
 If the closure only has a single expression, you can leave out `return` statement.
 */
let addClosure = { (a: Int, b: Int) -> Int in
    a + b
}
/*:
 ### Type Inference
 Swift can also use type inference to infer the return type. Here we've removed the return type, or `-> Int`, from the declaration of the closure.
 */
let subtractClosure = { (a: Int, b: Int) in
    a - b
}
/*:
 ### Shorthand Parameter Syntax
 Swift provides shorthand parameter names to inline closures, which can be used to refer to the values of the closure’s parameters by the names $0, $1, $2, and so on.
 */
names.sort({ $0 > $1 })
/*:
 ### Trailing Closures
 If you're passing a closure as the last parameter in a function's parameter list, you can write it as a `trailing closure.` A `trailing closure` is a closure that is written outside of (and after) the parentheses of the function call it:
 */
names.sort() { $0 > $1 }
