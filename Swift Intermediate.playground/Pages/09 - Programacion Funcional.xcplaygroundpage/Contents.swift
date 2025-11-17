import Foundation

//Tipo de dato (Int) -> Int
func sumar2(num: Int) -> Int {
    num + 2
}
//Tipo de dato (Int) -> Int
func sumar3(num: Int) -> Int {
    num + 3
}

//Tipo de dato () -> () = VOID
func thing() {
    print("Hello!")
}

func sumar(a: Int, b: Int) -> Int {
    a + b
}

let r1 = sumar2(num: 3)
let r2 = sumar3(num: 4)
thing()
sumar(a: 3, b: 4)

let suma2 = sumar2
let suma3 = sumar3
let fcoso = thing
let suma = sumar

//Invoca las funciones asigandas
suma2(3)
suma3(4)
thing()
suma(3, 4)

func sumaN(num: Int, operacion: (Int) -> Int) -> Int {
    operacion(num)
}

sumaN(num: 4, operacion: suma2)
sumaN(num: 4, operacion: suma3)

//Usando la funcion sumar2 como closure
let c2 = { (num: Int) -> Int in num + 2 }
sumaN(num: 6, operacion: c2)
// Usando el closure como ultima parte de la funcion sin el parametro operacion
sumaN(num: 8,) { (num: Int) -> Int in num + 2 }

let array = [4,2,3,5]
func calculadora(nums: [Int], operacion: (Int, Int) -> Int) -> Int {
    guard var acumulador = nums.first else { return 0 }
    for num in nums.dropFirst() {
        acumulador = operacion(acumulador, num)
    }
    return acumulador
}

calculadora(nums: array, operacion: sumar)
calculadora(nums: array, operacion: suma)
calculadora(nums: array, operacion: { (a: Int, b: Int) -> Int in a * b })
calculadora(nums: array, operacion: { (a: Int, b: Int) -> Int in a - b })


