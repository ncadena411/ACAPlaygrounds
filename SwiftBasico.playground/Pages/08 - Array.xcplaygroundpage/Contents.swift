// Coleccion de elementos en posiciones consecutivas Ordenada y a su ejecucion es por posicion entera.

import Foundation
import SwiftUI

let array: [Int] = [1,3,5,6,10,-3]
var array2: [String] = []


array2.append("Hello")
array2.insert("Holi", at: 0)
array2.insert(contentsOf: ["Hi", "Bye"], at: 2)

//Copia el valor a una nueva variable por ende se podria usar como una nueva variable
array2[3]


//Elemento desde Array Copia por Valor
//Copiar todo el Array Copia por valor aunque este en una clase
//Copiar la clase completa y usar un array adentro SI se modificaria el mismo array
// Es un muy buena practica usar reserveCapacity
array2.reserveCapacity(100)

//FLUENT INTERFACES
array.sorted().reversed()
// Por ejemplo en SwiftUI

Text("The text")
    .font(.largeTitle)
    .padding()

//This is only an array of 5 positions and only 5 positions
let array3: [5 of Int] = [1,2,3,4,5]

for i in array {
    print(i)
}

for i in array where i % 2 == 0 {
    print(i)
}

// This can be done via the Fluent interfaces
for i in array.sorted().reversed() {
    print(i)
}

