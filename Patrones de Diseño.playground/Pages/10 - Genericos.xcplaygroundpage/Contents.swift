import Foundation

// Un generico es un tipo de dato que NO se define en tiempo de compilacion sino en tiempo de ejecucion
// El tipo de dato depende de los tipos de datos que lo conformen
// El generico de define una sola vez por tipo si para esa ejecucion es de tipo double sera double hasta que termine con ese llamado

let a = 1.4
let b = 3.3
let c = 4
let d = 5

func suma(a: Int, b: Int) -> Int {
    a + b
}

suma(a: c, b: d)
// Does not work since the data are Doubles and not Int
//suma(a: a, b: b)

func imprimir<T>(a: T) {
    print(a)
}

imprimir(a: c)
imprimir(a: a)

func imprimirDos<T, U>(a: T, b: U) {
    print(a, b)
}

imprimirDos(a: c, b: b)
imprimirDos(a: c, b: d)

func devuelta<T>(_ value: T) -> T {
    value
}

let v1 = devuelta(a)
let v2 = devuelta(c)

let arrayN = [2,5,7,6,8,9,7,6,4,7,6,9,1,3,2,6,9]
let arrayS = ["Hola", "Adiós", "Sayonara", "Konichi Wa"]

func indiceEn<Element>(value: Element, array: [Element]) -> Int? where Element: Equatable {
    for (index, v) in array.enumerated() {
        if value == v {
            return index
        }
    }
    return nil
}

indiceEn(value: 8, array: arrayN)
indiceEn(value: "Sayonara", array: arrayS)
