import Foundation
import RegexBuilder

// The string is comprised of bytes all of the things in the string have the same count but their byte code is different between emojis or special characters and normal characters

let cadena1 = "Hola Paco Antonio"
cadena1.count
let cadena2 = "Hola Paño Antonio"
cadena2.count

cadena1.utf8.count
cadena2.utf8.count

cadena1.isEmpty
cadena1.lowercased()
cadena1.uppercased()
cadena1.capitalized
cadena1.contains("Anto")
cadena1.hasPrefix("Hola")
cadena1.hasSuffix("Paco")

let phrase = "One ring to rule them all, one ring to find them, one ring to bring them all and in the darkness bind them."

let words = phrase.components(separatedBy: " ")
let phraseBack = words.joined(separator: " ")

let apellidos = "Fernández Muñoz"
let busqueda = "fernandez munoz"
let nombre = "Julio"
let busca = "julio"

nombre.compare(busca) == .orderedSame
nombre.compare(busca, options: .caseInsensitive) == .orderedSame
apellidos.compare(busqueda) == .orderedSame
apellidos.compare(busqueda, options: [.caseInsensitive, .diacriticInsensitive]) == .orderedSame

// To use a Regex in Swift 5.7 onward - Better send this for an AI to work with it
let passRegex = /"^(?=.*[a-z])(?=.*[A-Z])(?=.*[\d\W])[a-zA-Z\d\W]{8,32}$"/

//With RegexBuilder you can create regular expression in a declarative way
let allowedChars = ChoiceOf {
    Lookahead("a"..."z")
    Lookahead("A"..."Z")
    Lookahead("0"..."9")
    One(.anyOf("!\"#$%^&*()+,-./:;<=>?@[\\]^_`{|}~ "))
}

let regexEmail = Repeat(allowedChars, 8...32)

let clave1 = "Nico1991"
let clave2 = "chilinbinga"

do {
    try passRegex.wholeMatch(in: clave1) != nil
} catch {
    print(error)
}

do {
    try regexEmail.regex.wholeMatch(in: clave2) != nil
} catch {
    print(error)
}

let intro = """
One ring to rule them all.
One ring to find them.
One ring to bring them all,
And in the darkness bind them
"""

let year = 1994
let cadena = "This is a string \(year)"
// Si queremos interpolar en un raw string usamos \#()

let array = ["H", "O", "L", "A"]
let ol = array[1...2]
