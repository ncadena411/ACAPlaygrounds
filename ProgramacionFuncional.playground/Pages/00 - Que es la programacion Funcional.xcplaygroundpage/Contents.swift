import Foundation

// Programacion funcional es cuando usamos FUNCIONES como elementos de primer orden del lenguaje -> Como tipos de datos
// En programacion funcional, las funciones pueden ser asignadas a variables o constantes, pasadas como parametro y devueltas como resultado desde otras funciones, exactamente como lo hariamos con valores simples
//Ejemplo func hagoCosas(n: Int, f1: (Int) -> Int) -> Int en este caso f1 es una funcion que tiene un parametro Int y devuleve un Int
// La programacion funcional se basa en el calculo lambda

//Tenemos una funcion normal
func sumar(a: Int, b: Int) -> Int {
    a + b
}
//Para invocarla utilizariamos lo siguient
let suma = sumar(a: 3, b: 5) //Esto significa que suma es de tipo Int pues en Swift se tipifica el valor del retorno de la funcion y se infiere en la constante, sumar despues de ser invocada let suma: Int

// Cuando asignamos el nombre de una funcion sin la invocacion a una constante/variable obtenemos el tipo de dato de la funcion
//En este caso no estamos invocando la funcion no tiene parentesis ni valores de parametros por ende ahora sumaFuncionTipificada seria tipo (Int), (Int) -> Int una funcion con dos parametros Int que devuelve Int
let sumaFuncionTipificada = sumar
// Que las funciones sean de PRIMER ORDEN del lenguaje permiten no solo ser almacenadas en constantes o variables sino algo esencial que se puedan enviar a otras funciones! como parametro por ejemplo
func calculo(numeros: [Int], algoritmo: (Int, Int) -> Int) -> Int? {
    //Por ejemplo podria usar el algoritmo para algo asi
    algoritmo(numeros[0], numeros[1])
}
calculo(numeros: [2,3,4], algoritmo: sumar)

//Funciones de orden mas alto (Higher Order Functions)
//Una funcion de order superior es aquella que recibe y devuelve una funcion como parametro, permitiendo construir funciones mas complejas
// Por ejemplo Map, Sorted, Filter, Reduce
// Para ser programacion funcional siempre han de devolver una copia del resultado, y no modifico el elemento original.


