import Foundation

// Variables are the only ones that can be optional
var number: Int?
// theNumber is tipo INT
// number es de tipo INT? -> Opcional
if let theNumber = number {
    print(theNumber)
}

//Shorthand expression USAR SIEMPRE!!!
if let number {
    number + 3
}
// son lo mismo
if let number = number {
    number + 3
}

ambito: do {
    guard let number else {
        break ambito
    }
    number + 10
}

