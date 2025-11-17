import Foundation

class Jugador {
    let nombre: String
    var vida: Int {
        willSet {
            //Se va a hacer un cambio de valor pero aun no se ha realizado, se VA a realizar no hay forma de pararlo se puede usar el valor antes en este caso con vida o se despues del cambio con newValue
            if newValue <= 0 {
                muerto = true
            }
        }
        didSet {
            //Se usa para mirar lo que pasa despues del cambio se puede "devolver al valor" con oldValue
            if vida < 0 {
                vida = 0
            }
        }
    }
    var muerto = false
    
    init(nombre: String, vida: Int) {
        self.nombre = nombre
        self.vida = vida
    }
}

final class Luchador: Jugador {
    var fuerza: Int
    
    init(nombre: String, vida: Int, fuerza: Int) {
        self.fuerza = fuerza
        super.init(nombre: nombre, vida: vida)
    }
    
    func atacar() -> Int {
        muerto ? 0 : Int.random(in: (fuerza/2)...fuerza)
    }
    
    func atacarOponente(_ otro: Luchador) {
        guard vida > 0, otro.vida > 0, !muerto, !otro.muerto else { return }
        otro.vida -= atacar()
        if otro.vida < 0 {
            otro.muerto = true
            otro.vida = 0
        }
    }
}

let vikingo = Luchador(nombre: "Eustaquio", vida: 30, fuerza: 20)
let amazona = Luchador(nombre: "Sigfrida", vida: 40, fuerza: 15)

vikingo.atacarOponente(amazona)
amazona.atacarOponente(vikingo)
vikingo.atacarOponente(amazona)
amazona.atacarOponente(vikingo)
vikingo.atacarOponente(amazona)
amazona.atacarOponente(vikingo)
