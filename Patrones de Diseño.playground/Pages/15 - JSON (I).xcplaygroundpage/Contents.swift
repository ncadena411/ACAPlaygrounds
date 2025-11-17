import Foundation

// Codable es en realidad un typealias que hace una suma de protocolos Decodable y Encodable juntos para convertir de una referencia externa en una de la app
// Decodable: Protocolo que permite por medio de funcionalidades creadas en este protocolo que un texto que dentro tenga una estructura valida de JSON pueda ser transformado en instancias de SWIFT (Normalmente Strucs siempre Strucs)
// Encodable: Coger instancias que ya existen en Swift y transformalas en su representacion textual en JSON
// Como leer un JSON: Se podria decir que los JSON en Swift son "Diccionarios String: Any"     Las llaves delimitan UN objeto {} y los corchetes [] delimitan colecciones de objectos donde los objectos deben tener la misma estructura por ejemplo en empleados

let json = """
{
  "departamento":8,
  "nombredepto":"Ventas",
  "director": "Juan Rodríguez",
  "empleados":[
    {
      "nombre":"Pedro",
      "apellido":"Fernández"
    },{
      "nombre":"Jacinto",
      "apellido":"Benavente"
    } 
  ]
}
""".data(using: .utf8)!

// IMPORTANTE para poder utilizar Codable la clave en el JSON se debe llamar EXACTAMENTE IGUAL que como llamamos a la propiedad en el struct
struct Departamento: Codable {
    let departamento: Int
    let nombredepto: String
    let director: String
    let empleados: [Empleado]
}

struct Empleado: Codable {
    let nombre: String
    let apellido: String
}

// We can use JSONDecoder to decode the JSON into a certain model that we use in our app
// On the contrary if we wanto to encode a model that we have in Swift to JSON we can use JSONEncoder
// Para utilizar JSONDecoder necesitamos el typo de dato del departamento por esto se le debe poner el .self -> Departamento.self

do {
    let departamento = try JSONDecoder().decode(Departamento.self, from: json)
    print(departamento)
    print(departamento.empleados)
    
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try encoder.encode(departamento)
    print(String(data: data, encoding: .utf8)!)
} catch {
    print(error)
}
