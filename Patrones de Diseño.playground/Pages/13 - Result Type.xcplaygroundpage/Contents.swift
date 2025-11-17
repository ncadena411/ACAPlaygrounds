import UIKit

//Puedo crear un enum que genericamente puede dar un caso de exito y otro de error u otros pero para este caso particular debe ser un exito y un error para que despues puedar ser covertido al tipo de sistema Result<Sucess, Failure>
enum Resultado<Int, String> {
    case exito(Int)
    case error(String)
}

let result1: Resultado<Int, String> = .exito(5)
let result2: Resultado<Int, String> = .error("Falló")

enum StringErrors: LocalizedError {
    case emptyString
    case emptySub
    case emptyStringSub
    case subNotExists(String)
    
    var errorDescription: String? {
        switch self {
        case .emptyString:
            "La cadena es vacía"
        case .emptySub:
            "La subcadena es vacía"
        case .emptyStringSub:
            "La cadena y subcadena son vacías"
        case .subNotExists(let string):
            "La subcadena \(string) no existe en la cadena"
        }
    }
}

func buscarSubcadena(cadena: String, sub: String) -> Result<Int, StringErrors> {
    guard !(cadena.isEmpty && sub.isEmpty) else { return .failure(.emptyStringSub) }
    guard !cadena.isEmpty else { return .failure(.emptyString) }
    guard !sub.isEmpty else { return .failure(.emptySub) }
    guard let rango = cadena.range(of: sub, options: [.caseInsensitive,
                                                      .diacriticInsensitive]) else {
        return .failure(.subNotExists(sub))
    }
    return .success(cadena.distance(from: cadena.startIndex, to: rango.lowerBound))
}

let text = "Space, the final frontier. These are the voyages of the starship Enterprise. Its mission: to explore strange new worlds. To seek up new lifeforms and new civilizations. To boldy go where no man has gone before."

// Ahora no necesitamos envolver el llamado en un Do pues ahora no es una fucion que hace throws
let r1 = buscarSubcadena(cadena: text, sub: "starship")
let r2 = buscarSubcadena(cadena: text, sub: "woman")
let r3 = buscarSubcadena(cadena: text, sub: "")
let r4 = buscarSubcadena(cadena: "", sub: "worlds")
let r5 = buscarSubcadena(cadena: "", sub: "")

// Cuando ya tengo una respuesta puedo revisar los casos y mirar si son success o failure
// Pattern matching de ambas propiedades
switch r1 {
case .success(let pos):
    print("Subcadena en la posición \(pos)")
case .failure(let error):
    print("Error: \(error.localizedDescription)")
}

//Pattern matching solo con failure
if case .failure(let error) = r2 {
    print(error.localizedDescription)
}

// el get() Devuleve el valor del exito pero como una expresion que lanza errores para capturar los errores correspondientes, para sacar el valor de ahi.
do {
    let pos = try r3.get()
} catch {
    print(error.localizedDescription)
}

// Cambiar valores sin llegar a explorarlos
// Cuando se usa map podemos cambiar el tipo de dato del solo del SUCCESS por ejemplo aca de Int a Result <String, StringErrors>
// Cuando se usa flatMap recibe el tipo de resultado y puedo volver a mapearlo o a sucess o a failure "Una especie de post procesado"
// Cuando se usa mapError puedo capturar el error y enviar un nuevo tipo de error, al contrario de lo que se puede hacer con map
let newR4 = r4.map { num in
    "Valor encontrado en la posición \(num)"
}

//Forma OBSOLETA de utilizar el filemanager
let file = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appending(path: "bourne.json")
// Desde iOS 15 esta es la forma correcta!
let fileGood = URL.documentsDirectory.appending(path: "bourne.json")

//Whenever we try to get something from disk it is a try operation this means that we have to use try. We can use the Result operator to bind this Data(contentsOf) and get a result type
let loadedData = Result {
    try Data(contentsOf: fileGood)
}

let imageGood = URL.documentsDirectory.appending(path: "jobs.png")

// En este caso podemos mappear la carga de la imagen que cuando la obtengamos se cargue en un UIImage.
let loadedImage = Result {
    try Data(contentsOf: imageGood)
}.map {
    UIImage(data: $0)
}

