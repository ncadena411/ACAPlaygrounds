import Foundation

@MainActor
final class Cars {
    //Elemento estatico de cars solo le pertenece a Cars no se puede usar desde afuera, se podria llamar subtipo de Cars
    enum CarType {
        case utilitario
        case berlina
        case granBerlina
        case SUV
    }
    // Es una propiedad o metodo que no pertenece a la clase como elemento de instancia, pertenece al TIPO de la clase por ejemplo un init o coches como ahora
    //Se convierte en elemento global como si fuera una clase o struct 
    static var coches = 0
    let model: String
    var distancia: Double = 0.0
    var type: CarType
    
    init(model: String, type: CarType) {
        self.model = model
        self.type = type
        Cars.coches += 1
    }
    
    func conducir(km: Double) {
        distancia += km
    }
}

let car1 = Cars(model: "Toyota", type: .utilitario)
car1.conducir(km: 100.0)
print("\(car1.model) ha recorrido \(car1.distancia) km")
let car2 = Cars(model: "Honda", type: .berlina)
car2.conducir(km: 100.0)
print("\(car2.model) ha recorrido \(car2.distancia) km")
let car3 = Cars(model: "Ford", type: .SUV)
car3.conducir(km: 100.0)
print("\(car3.model) ha recorrido \(car3.distancia) km")
Cars.coches
