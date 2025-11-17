import Foundation


func calculadora(nums: [Int], operacion: (Int, Int) -> Int) -> Int {
    guard var acumulador = nums.first else { return 0 }
    for num in nums.dropFirst() {
        acumulador = operacion(acumulador, num)
    }
    return acumulador
}

let array = [4,2,3,5]
calculadora(nums: array, operacion: { (a: Int, b: Int) -> Int in a * b })
//A simplified version of the above closure
calculadora(nums: array, operacion: { (a, b) in a * b })
calculadora(nums: array, operacion: { $0 * $1})
calculadora(nums: array) { $0 * $1 }
//WTF this works! El sistema busca si hay una funcion que cumpla con esa operacion por ejemplo si le mando $ daria error pero si le doy + * + el busca esas funciones en el sistema y la usa!
calculadora(nums: array, operacion: *)
