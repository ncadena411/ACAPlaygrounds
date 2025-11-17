import Foundation

// El patron Observable, en su esencia, permite reaccionar a los cambios que ocurren en ciertas propiedades dentro de una instancia
// Uno de los pilares fundamentales de SwiftUI es este patron pues cuando hay un cambio en una variable @State la UI se pinta de nuevo completa basada en este cambio
// Dentro de Swift, una especia de patron Observable, seria el didSet / willSet que podemos usar en las clases o structs
// En Swift podemos usar el patron KVO que es de Objective-C y solo funciona con clases que heredan de NSObject
// Tambien podemos utilizar el framework notification center, en Swift 6.2 podemos crear observadores como secuencias asincronas (un for-in asyncrono)
