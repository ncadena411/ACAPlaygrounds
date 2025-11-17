import UIKit

// Como sabemos la instancia de una clase en Swift es un dato por referencia por ende cada vez que se crea uno se crea una copia!
// Esto es importante pues para utilizar el patron Singleton, lo que hay almacenado en la constante (Shared) no es el dato en si es el puntero de memoria que apunta a donde dicho dato esta almacenado
// El patron singleton permite que una misma instancia de una clase ofrezcan copias de si misma a toras las partes del programa que lo usan, por lo que todas usaran la misma exacta copia por referencia.
// Este es un patron perfecto para Swift porque Swift es un lenguaje de ambito global

// OJO Choca directamente con la concurrencia ESTRICTA porque debe estar segregada a un contexto de aislamiento (Por ejemplo @MainActor)
// Quien quiera acceder a dicho singleton debera hacerlo siempre desde el mismo contexto de ejecucion que tiene el singleton


@MainActor
final class ConfigurationManager {
    // Recordar que las propiedades de tipo static pertenecen a la clase y NO a la instancia por eso se deben llamar ConfigurationManager (la clase) .shared (la instancia) .el valor
    static let shared = ConfigurationManager()
    var language = "es"
    var dark = false
}

let conf1 = ConfigurationManager()
let conf2 = ConfigurationManager()

ConfigurationManager.shared.language
ConfigurationManager.shared.language = "en"
ConfigurationManager.shared.language

