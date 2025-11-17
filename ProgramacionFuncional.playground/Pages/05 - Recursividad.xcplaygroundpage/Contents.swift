import Foundation

// FIBONACCI
// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34...

// f(4)                       + f(3)
// f(3)          + f(2)       + f(2) + f(1)
// f(2) + f(1)   + f(1) f(0)  + f(1) + f(0)
// f(1) + f(0)   + 1 + 0      + 1 + 0
// +1 + 0


var contador = 0
@MainActor func fibonacci(_ n: Int) -> Double {
    contador += 1
    return n < 2 ? Double(n) : fibonacci(n - 1) + fibonacci(n - 2)
}

// MEMOIZE
// Diferencia entre leer memoria y calcular un valor

var contadorM = 0
var cache: [Int: Double] = [:]

@MainActor func fibonacciMemoize(_ n: Int) -> Double {
    if let result = cache[n] {
        return result
    }
    
    contadorM += 1
    let r =  n < 2 ? Double(n) : fibonacciMemoize(n - 1) + fibonacciMemoize(n - 2)
    cache[n] = r
    return r
}



