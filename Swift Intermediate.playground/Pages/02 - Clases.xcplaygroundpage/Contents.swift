import Foundation

//Las clases crean tipos de datos - objetos
class ClaseInicial {
    var propiedad = 1
    
    func show() {
        print(propiedad)
    }
}

let clase1 = ClaseInicial()
clase1.show()
let clase2 = ClaseInicial()
clase2.propiedad = 2
clase2.show()
//Una copia por referencia que copia la misma direccion de memoria y por ende si cambio cosas en una cambia en la otra
let clase3 = clase2
clase3.show()
clase3.propiedad = 3
clase3.show()
clase2.show()
clase2 === clase3

// MUY mala practica hacer un var clase3 = clase2

class ClaseTest {
    //Propiedad de instancia solo existe cuando se crea una instancia de la clase
    let propiedad1: Int
    let propiedad2: Int
    
    // Designated init -> Siempre debe haber un init que inicialize todas las variables no es necesario pasarlas todas por parametro
    
    // self es la referencia de la clase a si misma -> es una instancia de ClaseTest
    init(propiedad1: Int) {
        self.propiedad1 = propiedad1
        self.propiedad2 = propiedad1 + 2
    }
    
    init(propiedad1: Int, propiedad2: Int) {
        self.propiedad1 = propiedad1
        self.propiedad2 = propiedad2
    }
}

let test1 = ClaseTest(propiedad1: 6)
let test2 = ClaseTest(propiedad1: 7, propiedad2: 9)
let test3 = ClaseTest.init(propiedad1: 4)
let test4 = ClaseTest.init(propiedad1: 8, propiedad2: 5)
