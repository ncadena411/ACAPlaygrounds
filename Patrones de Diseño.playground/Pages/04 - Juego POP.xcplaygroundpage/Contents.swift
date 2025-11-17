import Foundation

// La union de los structs, los protocolos, y sus extensiones conforma el paradigma de la programacion Orientada a Protocolos
// SIEMPRE usaremos structs son mucho mas eficientes pues al ser tipos por valor se crean en el stack de memoria en una cola LIFO, que asigna espacio de forma automatica y rapida, reservando un bloque fijo para variables locales, con tamaño "predecible"
// Solo usaremos clases cuando el framework lo requiera, Las clases usan el HEAP, un area de memoria dinamica donde se asigna espacio en tiempo de ejecucion para objetos grandes o de larga duracion como instancias de clases: un proceso mas lento de busqueda y liberacion de bloques libres

protocol Personaje {
    var name: String { get }
}

protocol Hablador {
    var dialogos: [String] { get set }
    func hablar(frase: Int)
}

protocol Mortal {
    var vida: Int { get set }
    var mueto: Bool { get set }
}

protocol Atacante {
    var ataque: Int { get }
    func atacar() -> Int
}

// Puedo usar esto para poner una implementacion por defecto para un protocolo
extension Atacante {
    func atacar() -> Int {
        Int.random(in: ataque / 2 ... ataque)
    }
}

enum Armas: Int {
    case espada, hacha, arco, magia
}

//Protocolo anidado ahora cualquiera que quiera ser armado deberia ser tambien atacante
protocol Armado: Atacante {
    var arma: Armas { get }
}

struct AncianaBarriendo: Personaje {
    var name: String
}

struct Gallina: Atacante {
    let ataque: Int
    func atacar() -> Int {
        Int.random(in: ataque / 2 ... ataque)
    }
}

struct Monje: Personaje, Hablador {
    let name: String
    var dialogos: [String]
    func hablar(frase: Int) {
        guard frase < dialogos.count else { return }
        print(dialogos[frase])
    }
}

struct Soldado: Mortal, Armado {
    var vida: Int
    var mueto: Bool = false
    var arma: Armas
    let ataque: Int
    func atacar() -> Int {
        Int.random(in: ataque / 2 ... ataque)
    }
}

struct BigBoss: Personaje, Mortal, Hablador, Armado {
    let name: String
    var dialogos: [String]
    let nombre: String
    var vida: Int
    var mueto: Bool = false
    var arma: Armas
    let ataque: Int
    
    func hablar(frase: Int) {
        guard frase < dialogos.count else { return }
        print(dialogos[frase])
    }
    
    func atacar() -> Int {
        Int.random(in: ataque / 2 ... ataque)
    }
}
