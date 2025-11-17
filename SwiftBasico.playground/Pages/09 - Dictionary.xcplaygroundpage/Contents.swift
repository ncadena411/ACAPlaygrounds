// Una colección no-ordenada, no-consecutiva de pares clave-valor (key-value pairs), donde cada clave única se mapea a un valor Hashable

// HASH - Un hash es un número entero único generado a partir de un valor, que se utiliza para identificar y localizar rápidamente ese valor en una colección (como un diccionario).

// Hashable: Un tipo es Hashable cuando puede convertirse en un valor hash (número entero). Este valor hash debe ser consistente (el mismo valor siempre produce el mismo hash) y permite que el diccionario encuentre elementos de forma eficiente.

import Foundation

let dic0: [String: Int] = ["One": 1, "Two": 2, "Three": 3]
var dic1 = [0: "Zero", 1: "One", 2: "Two", 3: "Three"]

dic1[2]
dic0["TRES"]

// Siempre es un OPCIONAL porque no sabemos si existe el dato
let v = dic0["Zero"]
// La buena practica es si se quiere usar un operador de coalesencia
let z = dic0["Four", default: 0]

// Si existe lo modifica y si no existe lo agrega
dic1[0] = "ZERO"
dic1[4] = "FOUR"
dic1.updateValue("Zero", forKey: 0)

// To remove values
dic1[4] = nil
dic1.removeValue(forKey: 3) // -> this is the good practice

for dic in dic0 {
    print(dic.key, dic.value)
}
