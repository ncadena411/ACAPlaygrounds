import Foundation

class Personaje {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

class Hablador: Personaje {
    let dialogos: [String]
    
    init(name: String, dialogos: [String]) {
        self.dialogos = dialogos
        super.init(name: name)
    }
}

class Mortal: Personaje {
    var vida: Int
    var muerto = false
    
    init(name: String, vida: Int) {
        self.vida = vida
        super.init(name: name)
    }
}
