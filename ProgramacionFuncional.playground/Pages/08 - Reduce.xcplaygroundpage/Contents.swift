import Foundation


//El resultado de combinar los resultados de la secuencia basado en la closure pasada
//Sirve para mapeos + combinaciones
let array = [3,5,8,7,9,1,3,5,3,2,6,7,5,8,6,2,1,9]

//Sumar el 0 + 3 despues 3 + 5 despues 8 + 8 despues 16 + 7
array.reduce(0) { partialResult, num in
    partialResult + num
}
// Same expression as the one on the top
array.reduce(0) { $0 + $1 }

//No return type just acumulate directly into the value in this case into 0
array.reduce(into: 0) { partialResult, num in
    partialResult += num
}



