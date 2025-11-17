import UIKit


// Void representation in the system is ()
// A function is keyword func followed by name of the function, Parameters in () or no parameters just () if it has a return then -> Type to return and then {}

//Declaracion de la funcion
func showMessage() {
    let title = "ERROR:"
    let message = "S'apetao'to"
    print(title, message)
}

//Invocation of function with the ()
showMessage()

// Parameters in Swift are constant you cannot change them
func showMessage(message: String) {
    let title = "ERROR:"
    print(title, message)
}

showMessage(message: "Help me!")

func showMessage(title: String, message: String) {
    print(title, message)
}

showMessage(title: "My title", message: "I'm message")

// To return we need to do -> Type of the data to return
// No need to add return for Basic operators
// Una función o closure que contiene una sola expresión que produce un valor, permitiendo omitir la palabra clave return. El compilador infiere automáticamente que esa única expresión es el valor de retorno.
func newNumber() -> Int {
    .random(in: 1...20)
}

//This knows it is an Int
let x = newNumber()

func newNumber(min: Int, max: Int) -> Int {
    guard min < max else { return 0 }
    return .random(in: min...max)
}

// Fallable function
// A function that returns an optional
//Header of the function is the specification of the function
//What is between {} is the implementation
func sum(numbers: [Int]) -> Int? {
    guard numbers.count > 1 else { return nil }
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

// A more optimal solution
func sum2(numbers: [Int]) -> Int? {
    guard var sum = numbers.first, numbers.count > 1 else { return nil }
    for number in numbers {
        let secureSum = sum.addingReportingOverflow(number)
        if !secureSum.overflow {
            sum += number
        } else {
            return .max
        }
    }
    return sum
}

sum(numbers: [4,3,5])
sum(numbers: [])


// Variadic parameter for example Int...
// We can also add a default value with = for any function
// Name of external parameter in optionalValue
func sum3(numbers: Int..., optionalValue op: Bool = true) -> Int? {
    guard var sum = numbers.first, numbers.count > 1 else { return nil }
    for number in numbers {
        let secureSum = sum.addingReportingOverflow(number)
        if !secureSum.overflow {
            sum += number
        } else {
            return .max
        }
    }
    return sum
}
sum3(numbers: 5,6,7)

// inout makes a function parameter “pass-by-reference” Instead of passing a copy of the value, Swift allows the function to modify the original variable directly.
func modifiableFunction(numbers: inout [Int]) -> Int? {
    //Inside the function, you can mutate the parameter, and those changes will be visible to the caller after the function returns.
    numbers.append(0)
    return 0
}

//It is key that this value is a var and not a let
var array = [1,2,3,4]
//With the & we send a point in memory so it can be modified
//The & prefix indicates you are passing the variable by reference to an inout parameter.
modifiableFunction(numbers: &array)

func readFile(_ file: String) -> String {
    print("Open File")
    let result = Int.random(in: 1...10)
    defer {
        print("Close File")
    }
    return switch result {
    case 1: 
        "File not found"
    case 3: 
        "Empty file"
    case 5: 
        "Corrupted file"
    case 7: 
        "Unknown Error"
    default: 
        "Not Controled Error"
    }
}

let content = readFile("thing.txt")
print(content)

// No ownership transfer: The callee doesn’t become the owner of image. The caller retains ownership, and the value’s lifetime is guaranteed to outlive the call.
// Read-only access: A borrowing parameter is not mutable within the function. You can read from image but not modify it.
// No copy unless needed: For types that could be expensive to copy, borrowing allows the compiler to avoid unnecessary retains/copies. It’s a performance hint enabling safe, efficient access.
// Caller remains usable: After the call returns, the caller can keep using the same value normally, since it was only borrowed (not consumed).
func draw(image: borrowing String) {
    
}
draw(image: "SomethingThatIsSUPERBIG")


// consuming: Transfers ownership into the callee, which may invalidate or move-from the original value (caller typically shouldn’t use it afterward). borrowing does not transfer ownership; the caller remains the owner.
func mostrar(texto: consuming String) {
    print(texto)
}
var cadena = "Hola que tal"
mostrar(texto: cadena)
// Cadena should not be valid after the string is consumed
