import UIKit

//Nos permite filtrar los resultados

let array = [3,5,8,7,9,1,3,5,3,2,6,7,5,8,6,2,1,9]
let names = ["Alias", "Alien", "Aliens", "AmazingStories", "AmericanTail", "BasicInstict", "BoysFromBrazil"]

//Por ejemplo filtrar todos los numeros menores de 6
//Cada true lo incluye en el arreglo cada false lo descarta
array.filter { num in
    num < 6
}

let imagesC = names.compactMap { name in
    UIImage(named: "\(name).jpg")
}
// Por ejemplo filtrar las imagenes que tengan 100x100
let image100 = imagesC.filter { image in
    image.size.height == 100 && image.size.width == 100
}

//All stasify, drop, prefix
