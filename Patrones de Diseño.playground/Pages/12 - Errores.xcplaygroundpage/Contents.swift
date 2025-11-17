import Foundation

let text = "Space, the final frontier. These are the voyages of the starship Enterprise. Its mission: to explore strange new worlds. To seek up new lifeforms and new civilizations. To boldy go where no man has gone before."

func buscarSubCadena(cadena: String, sub: String) -> Int? {
    guard !cadena.isEmpty,
          !sub.isEmpty,
          let rango = cadena.range(of: sub, options: [.caseInsensitive,
                                                      .diacriticInsensitive]) else {
        return nil
    }
    return cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
}

buscarSubCadena(cadena: text, sub: "starship")
buscarSubCadena(cadena: text, sub: "woman")
buscarSubCadena(cadena: text, sub: "")
buscarSubCadena(cadena: "", sub: "worlds")
buscarSubCadena(cadena: "", sub: "")

enum StringErrors: Error {
    case emptyString
    case emptySub
    case emptyStringSub
    case subNotExits
}

func buscarSubCadenaThrowing(cadena: String, sub: String) throws(StringErrors) -> Int  {
    guard !(cadena.isEmpty && sub.isEmpty) else { throw StringErrors.emptySub }
    guard !cadena.isEmpty else { throw StringErrors.emptyString }
    guard !sub.isEmpty else { throw StringErrors.emptySub }
    guard let rango = cadena.range(of: sub, options: [.caseInsensitive,
                                                      .diacriticInsensitive]) else {
        throw StringErrors.subNotExits
    }
    return cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
}

//Todos los metodos que tienen throws deben ser llamados en un try y ademas dentro de un ambito do para poder hacerle catch a los errores
// Si no fuera tipado no podemos hacer catch con los casos que queremos

do {
    try buscarSubCadenaThrowing(cadena: text, sub: "woman")
} catch .emptyString {
    print("La cadena esta vacia")
} catch .emptyStringSub {
    print("La cadena y la subcadena son vacias")
} catch .subNotExits {
    print("La subcadena es vacia")
} catch .emptySub {
    print("No Existe la subcadena")
}

enum BetterStringErrors: LocalizedError {
    case emptyString
    case emptySub
    case emptyStringSub
    case subNotExits(String)
    
    var errorDescription: String? {
        switch self {
        case .emptyString:
            "La cadena esta vacia"
        case .emptyStringSub:
            "La cadena y la subcadena son vacias"
        case .subNotExits(let string):
            "La subcadena \(string) no existe en la cadena"
        case .emptySub:
            "No Existe la subcadena"
        }
    }
}
