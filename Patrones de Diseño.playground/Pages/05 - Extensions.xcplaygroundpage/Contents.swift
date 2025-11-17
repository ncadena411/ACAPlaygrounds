import SwiftUI

// Todas las clases y structs que pertenecen al sistema, las que uno crea o las que son publicas a travez de API's, pueden ser extendidas en Swift por ejemplo String
// Nos permite añadir nuevos metodos y propiedades calculadas a cualquier elemento en Swift, tanto de instancia como estaticas.
// Una de las formas mas practicas es crear constructores, basados en componentes estaticos, que funcionan como si fueran enumeraciones
// Podemos extender cualquier tipo y crear nuevas implemtaciones por ejemplo
extension String {
    func getSubcadena(inicio: Int, fin: Int) -> String? {
        guard !isEmpty,
              inicio >= 0,
              inicio <= fin,
              fin < count else { return nil }
        let inicioIndex = index(startIndex, offsetBy: inicio)
        let finIndex = index(startIndex, offsetBy: fin)
        return String(self[inicioIndex...finIndex])
    }
    
    var palabras: Int {
        self.components(separatedBy: " ").count
    }
}

// Ejemplo con tipografia custom en SwiftUI
// Donde you vaya a usar estas fonts debo poner siempre el nombre de la font, el size y a que es relativo (Todo esto propenso a errores de tipeo)
// Y debo repetir esto las N veces que vaya a utilizar estas fuentes
Text("Titulo del video")
    .font(.custom("NameOfTheFont Bold", size: 14, relativeTo: .body))
Text("descripcion del video")
    .font(.custom("NameOfTheFont Medium", size: 8, relativeTo: .footnote))

//Para extender este comportamiento y que sea mas sencillo y practico de utilizar podemos usar la siguientes extension:

extension Font {
    @MainActor
    static let myFontBody: Font = .custom("NameOfTheFont Bold", size: 14, relativeTo: .body)
    @MainActor
    static let myFontFootNote: Font = .custom("NameOfTheFont Medium", size: 8, relativeTo: .footnote)
}

// Y de esta manera podemos utilizar nuestras extension
Text("Un titulo del video")
    .font(.myFontBody)
Text("Descripcion del video")
    .font(.myFontFootNote)
