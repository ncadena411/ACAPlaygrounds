import Foundation
import UIKit

//En lo posible se deben usar contantes y no variables
// Si son constantes el sistema puede asegurar que cuando se lean no importa si es en paralelo va a leer la misma informacion
// GOOD practice only have 1 designated initializer in the class
class Animal {
    let numberOfLegs: Int
    let sound: String
    let foodType: String
    
    init(numberOfLegs: Int, sound: String, foodType: String) {
        self.numberOfLegs = numberOfLegs
        self.sound = sound
        self.foodType = foodType
        self.talk()
    }
    // This should call the init that is designated instead of changing the variables directly, in fact it CAN'T
    convenience init(quadrupedWithSound sound: String, foodType: String) {
        self.init(numberOfLegs: 4, sound: sound, foodType: foodType)
    }
    
    deinit {
        
    }
    
    func talk() -> String {
        "Este es mi sonido \(sound)"
    }
}

let lion = Animal(numberOfLegs: 4, sound: "Roar", foodType: "Carnivorous")
lion.talk()
let jiraff = Animal(quadrupedWithSound: "Gritito", foodType: "Herviborous")
jiraff.talk()

class Domestico: Animal {
    let raza: String
    
    init(raza: String, numberOfLegs: Int, sound: String, foodType: String) {
        self.raza = raza
        //Desde una subclase solo podemos llamar inits designados no de conveniencia
        super.init(numberOfLegs: numberOfLegs, sound: sound, foodType: foodType)
    }
    
    func pasear() {
        
    }
    
    // Para override es mejor usar el super. whatever para añadir funcionalidad
    override func talk() -> String {
        let mensage = super.talk()
        return mensage.dropLast().appending("y mi raza es \(raza)")
        
    }
}

let gato1 = Domestico(raza: "Siames", numberOfLegs: 4, sound: "Miau", foodType: "Carnivore")

final class MiTablaToChetada: UITableViewController {
    
}
