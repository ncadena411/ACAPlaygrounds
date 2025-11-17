//Coleccion no-ordenada no consecutiva no accesibles de valores unicos. Se usa para saber si un dato está o no esta. Se puede hacer todo tipo de algebra de conjuntos

import Foundation

let conjunto0: Set = [1,4,2,3,1]
var conjunto1: Set = [6,3,4,5,2,1]

conjunto0.count
conjunto0.isEmpty

conjunto1.insert(7)
conjunto1.insert(10)

let x = conjunto1.remove(7)

conjunto1.contains(18)

let c1 = conjunto1.union(conjunto0)
//conjunto1.formUnion(conjunto0)
let c2 = conjunto1.subtracting(conjunto0)
//conjunto1.substract(conjunto0)
let c3 = conjunto1.intersection(conjunto0)
//conjunto1.formIntersection(conjunto0)
let c4 = conjunto1.symmetricDifference(conjunto0)
//conjunto1.formSymmetricDifference(cojunto0)

let array = [1,3,4,12,5,2,1,2,3]
Array(Set(array))
