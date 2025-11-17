import Foundation

//Es un tipo de dato que define un grupo de valores relacionados y se puede trabajar con seguridad de datos
// Un set finito de datos con un codigo legible
// Perfecto para usar con Switch
// @frozen cuando le dices al sistema que eso no va a cambiar - no really needed

enum TipoDispositivo {
    case iPhone
    case iPad
    case watch
    case tv
    case visionPro
    case homePod
}

let device1: TipoDispositivo = .visionPro
let device2: TipoDispositivo = .tv

if device1 == .homePod {}
func buy(device: TipoDispositivo) {}
buy(device: .iPhone)

enum Operation {
    case sum, substract, multiplication, division
}

func calculadora(nums: [Int], operation: Operation) -> Int? {
    guard var calculated = nums.first else { return nil }
    for num in nums.dropFirst() {
        switch operation {
        case .sum:
            calculated += num
        case .substract:
            calculated -= num
        case .multiplication:
            calculated *= num
        case .division:
            calculated /= num
        @unknown default:
            print("This could happen if I add another not know case")
        }
        
    }
    return calculated
}

let numbers = [1,6,5,3,6,5,7,3]
calculadora(nums: numbers, operation: .multiplication)
calculadora(nums: numbers, operation: .sum)

enum Genre: Int {
    case comedy, drama, scifi, animation, peplum, western, superheroes
}

struct Movies {
    let title: String
    let director: String
    let genre: Genre
}

let movies1 = Movies(title: "Inception", director: "Christopher Nolan", genre: .scifi)
// Raw value - valor en bruto ya que la enumeracion es de Int
movies1.genre.rawValue
let new = Genre(rawValue: 3)

enum Genres: String {
    case comedy, drama, scifi, animation, peplum, western, superheroes
}
let genre1 = Genres.comedy
genre1.rawValue

//Tipificados y con valor asociado
enum Errores {
    case general(String)
    case status(code: Int)
    case unknown
}

let error1: Errores = .status(code: 404)
let error2: Errores = .general("Error General")

switch error1 {
case .general(let error):
    print("Error general: \(error)")
case .status(let code):
    print("Error de status: \(code)")
case .unknown:
    print("Que a pasao")
}

if case .status(let code) = error1 {
    print("Error de status: \(code)")
}

ambito: do {
    guard case .status(let code) = error1 else { break ambito}
    print("Error de status: \(code)")
}
