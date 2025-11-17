import Foundation
import SwiftUI

// Un closure es la version "anonima" de una funcion, encapsulada como bloque de codigo
// Cuando guardamos una funcion en una constante o variables, la estamos convirtiendo en un closure
// Al igual que pasamos funciones como parametros, tambien podemos pasar un closure como tal, escrito en el propio parametro de la funcion
// Cuando un closure es el ultimo parametro de una funcion podemos utilizar closures de cierre, trailing closures o multiple trailing closures

//Pasos para convertir una funcion en un closure
// 1. Quitarle la palabra clave func
// 2. Quitarle el nombre (Recordar es un bloque de codigo ANONIMO)
// 3. Pasar la llave que estaba usando para delimitar especificacion (signature) e implementacion a el principio de la funcion (ahora closure)
// 4. Agregarle la palabra clave in para delimitar el caso de arriba

//Por ejemplo para la funcion multiplicar
func multiplicar(a: Int, b: Int) -> Int {
    a * b
}
// Quedaria y el tipo de dato seria (Int, Int) -> Int
let closure = { (a: Int, b: Int) -> Int in
    a * b
}
//Este closure podria ser pasado como parametro directo en una funcion por ejemplo:
func calculo(numeros: [Int], algoritmo: (Int, Int) -> Int) -> Int? {
    //Por ejemplo podria usar el algoritmo para algo asi
    algoritmo(numeros[0], numeros[1])
}
//Notece que NO es necesario poner ni el tipo de datos de los parametros ni el tipo de datos del retorno pues el lenguaje infiere el tipo de los parametros y el retorno basados en la firma que tiene la funcion calculo
// Como es un trailing closure (El ultimo elemento de la firma del metodo) NO se necesita poner el nombre del parametro y cerramos la funcion como si "no existiera" el parametro algoritmo con un parentesis
calculo(numeros: [2,3,4]) { a, b in
    a * b
}

// Ejemplos en la clase:
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

func hagoCosas(n: Int, f1: (Int) -> Int, f2: (Int) -> Int) -> Int {
    f1(f2(n))
}

// Mas legible
hagoCosas(n: 3, f1: { $0 + 3 }, f2: { $0 + 5 })
//No es tan lejible
hagoCosas(n: 5) { n in
    n + 2
} f2: { n in
    n + 3
}

//The standard version of it
Button {
    print("Me han tocado")
} label: {
    Text("Tocame")
}
//More readble
Button( action: {
    print("Me han tocado")
}, label: {
    Text("Tocame")
})





