import Foundation

// Swift is NOT a Object Oriented Programming language it is a Protocol Oriented Programming language
// Se organiza alrededor de ese concepto, Apple siempre dice comienza con un protocolo para planear que quieres y como lo quieres
// Entonces que es un protocolo? Es un contrato (Blueprint) que especifica que metodos y propiedades debe tener un tipo. SIN proporcionar la implemetacion
// Cualquier clase, struct, actor, enumeracion que incluya los metodos y propiedades del protocolo puede ser to[adp con dicho protocolo.
// Ese Tipado permite abstraer (ocultar) el tipo real y trabajar con subtipos y dependencias
// Esto permite hacer acoplamiento leve: reduce la dependencia de tipos concretos facilitando cambios en tu codigo y hacerlo todo mas generico (Se puede intercambiar implementaciones por protocolo)
// Un tipo puede conformar multiples protocolos simultaneamente con tal de que cumpla con todas las especificaciones. Mientras en OOP una clase solo puede heredar de una clase padre.

struct Empleado: Identifiable, CustomStringConvertible, Equatable {
    var description: String {
        "Me llamo \(name) y mi correo es \(email)"
    }
    
    let id = UUID()
    let name: String
    let email: String
}

let empleado1 = Empleado(name: "Nicolas Cadena", email: "nicolas.cadena@gmail.com")
let empleado2 = Empleado(name: "Lina Correa", email: "lina.correa@gmail.com")
let empleado3 = Empleado(name: "Nicolas Cadena", email: "nicolas.cadena@gmail.com")

print(empleado1)
print(empleado2)

empleado1.email == empleado3.email
empleado1.name == empleado3.email

empleado1 == empleado3

// Podemos utilizar extensiones para proporcionar implementaciones "por defecto" o "compartidas" de forma que si la clase, struct, actor o enum que se conforma al protocolo no tiene el miembro que "extendemos", el protocolo lo incluira, eliminando la obligacion de hacerlo nosotros
// Esto ofrece el beneficio de la herencia (compartir comportamiento comun) sin la rigidez de las jerarquias de clases. Cualquier tipo que conforme al protocolo obtiene automaticamente esa implemetacion, pero puede sobreescribirla si lo desea.

protocol Caminable {
    func caminar()
}
protocol Corrible {
    func correr()
}

// Implementacion "por defecto" de los protocolos Caminable y Corrible
extension Caminable {
    func caminar() {
        print("Caminando...")
    }
}
extension Corrible {
    func correr() {
        print("Corriendo...")
    }
}

// No necesitamos hacer nada si queremos las implementaciones por defecto
struct Atleta: Caminable, Corrible {}

let atleta = Atleta()
atleta.caminar()
atleta.correr()

