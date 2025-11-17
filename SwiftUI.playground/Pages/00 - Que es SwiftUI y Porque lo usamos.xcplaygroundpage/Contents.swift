import SwiftUI

// SwiftUI es un Lenguaje Especifico de dominio (DSL) con un paradigma declarativo, funcional y reactivo que cambia la forma de pensar y concebir como definir una app.
// Uno de los propositos mas importantes es ver un codigo de SwiftUI y poder pintarlo en la cabeza sin ningun problema
// La representacion es inmutable, por lo que se nos obliga a separar las capas de datos mutables e inmutables
// Framework construido en orientacion a protocolos, hasta iOS 16 se uso combine pero ahora se usan macros de Swift para ello (@Observable)
// Usa structs inmutables para construir la UI y que esta se pueda desechar y volver a pintar sin mayor costo computacional
// Usa clases mutables para los datos que podrian cambiar en la UI. Lo que tiene el estado

// Para hacer una vista en SwiftUI se necesitan 3 caracteristicas
// 1. Importar SwiftUI
// 2. Crear un struct que conforme a el protocolo View
// 3. Este protocolo view tiene obligacion de crear un variable calculada body de tipo some View

struct SwiftUIView: View {
    var body: some View {
        Text("Hello World!")
    }
}

// Que es some? Some es un tipo opaco de retorno, lo que sea que yo devuelva tiene que ser una vista
// Ademas de esto todas las salidas de esta vista calculada DEBEN ser el mismo tipo de vista por ejemplo si voy a retornar un TEXT NO puedo tener un if que devuelva un imagen

//#Preview {
//    SwiftUIView()
//}
//Se puede usar el macro Preview llamando la instancia de la clase que necesitamos, en algunos casos se complica el uso de previews pero dependiendo del caso de uso se podria usar o no.
