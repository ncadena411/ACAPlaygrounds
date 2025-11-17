import SwiftUI

let array = [3,5,8,7,9,1,3,5,3,2,6,7,5,8,6,2,1,9]

func add1(array: [Int]) -> [Int] {
    var result: [Int] = []
    
    for i in array {
        result.append(i+1)
    }
    
    return result
}

add1(array: array)

//Programacion estructurada
func addDivisa(array: [Int]) -> [String] {
    var result: [String] = []
    
    for i in array {
        result.append("\(i)$")
    }
    
    return result
}

addDivisa(array: array)

func divisa(num: Int) -> String {
    "\(num)$"
}

//Generic T es un tipo de dato cualquier dependiendo retorne la funcion
//transform: (Int) throws(Error) -> T
array.map(divisa)
array.map { (num: Int) -> String in "\(num)$" }
array.map { "\($0)$" }
array.map { $0 + 1 }
//Visualy better?
array.map { num in
    num + 1
}

let names = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstict", "BoysFromBrazil"]

UIImage(named: "Alias.jpg")
//Devuelve una vista no se puede hacer nada con la imagen
Image("Alias.jpg")

//This will give us an array of optional UIImage
//UIImage as a optional constructor like init?(named name: String)
let images = names.map {
    UIImage(named: $0)
}
//If we want to get the non-optional and non-error results we can use compact map instead
let imagesC = names.compactMap {
    UIImage(named: "\($0).jpg")
}

//FlatMap -> Devuelve un array que devuelve los datos concatenados, de aplicar la transformacion en cada
// Por ejemplo se convertiria en 1 solo array con [0,2,4,1,5,8,7,1,4,8,6]
let matrix = [[0,2,4], [1,5,8,7], [1,4,8,6]]
matrix.flatMap { array in
    array
}

