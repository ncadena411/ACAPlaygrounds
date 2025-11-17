import Foundation

// Como se usa MVVM en el framework de SwiftUI

// Property Wrappers
//Las vistas en SwiftUl son structs inmutables, que no permiten el uso de funciones o propiedades de tipo mutating (Esto debido a que estamos en un struct y en una variable calculada en ese struct)
//Para poder tener elementos mutables, con estado, usamos los empaquetadores de propiedad (o property wrappers).
//Un empaquetador crea una propiedad que en realidad es una instancia que apunta a una propiedad "oculta" de la instancia.
//El empaquetador contiene la instancia de una clase y cuando modificamos su valor estamos usando un patrón setter/getter de una propiedad con mutabilidad en una clase externa.
//De esta forma, un empaquetador nos permite usar datos mutables en un tipo inmutable, sacando la mutabilidad fuera.
//El dato que modificamos es una propiedad calculada de la instancia del empaquetador llamada wrappedValue

// El Property Wrapper @State
// El empaquetador @State crea una instancia capaz de conectar con el protocolo View para provocar una actualización de la vista que lo contiene cuando su propiedad cambia de valor.
// Cada vez que el wrappedVa lue que contiene el aState cambia su valor, el protocolo View recibe una señal y provoca que la Ul se refresque mostrando cualquier modificación.
// Hasta ios 16, los @State enviaban una señal usando la librería Combine a través de un sujeto de paso.
// En iOS 17 la señal es enviada a través de una macro de Swift que emite una señal de seguimiento de observación.
// @State solo puede ser usada de forma local en una vista (tipo View) o una escena (tipo Scene). Si se usa en otro lugar, funcionará... pero su señal no será escuchada por nadie.
// Debe ser utilizado cuando queremos "trackear" el estado de una variable que se cambia en la vista en la que estamos utilizando por ejemplo cambiar el color a un boton

