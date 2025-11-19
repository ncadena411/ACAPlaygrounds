import Foundation

//Que es un actor?
// Los actores son clases preparadas para asincronía.
// Sus propiedades evitan el data race bloqueando el acceso a cualquier propiedad, por lo que obligan al uso de sus instancias dentro de un contexto asíncrono.
// En la propia definición del actor, la protección a la concurrencia es implícita y no hay que programarla.
// Todos las propiedades mutables y los métodos que acceden a las mismas están protegidos por defecto con aislamiento y protección de su contexto de forma automática.
// Pero cuando creamos una instancia de un actor, el acceso a cualquier propiedad mutable o método que acceda a estas se vuelve de acceso asíncrono, siempre en un Task.
// Así evita que cuando dos procesos intenten leer a la vez un dato, puedan conseguirlo porque uno de ellos siempre quedará a la espera que el otro termine.

//Actores Globales e Hilos

// Un actor global es un mecanismo de aislamiento que permite 'atar' código a un dominio de aislamiento compartido.
// Puede usarse como atributo en clases, structs, métodos o propiedades para garantizar que estas solo se acceden desde el contexto de aislamiento del actor global.
// Esto previene data races de forma efectiva al asegurar que todo el código anotado con el actor global comparte el mismo dominio de aislamiento.
// Al atar algo a un actor global, estamos previniendo de forma efectiva un data race, porque estamos aislando este a un hilo.
// El actor global se crea como un patrón singleton de un actor.
// Los accesos a código aislado por un actor global requieren await cuando se accede desde fuera de su dominio de aislamiento, pero no cuando se accede desde código que ya está aislado en el mismo actor global.
// Imagina que tienes cualquier clase, método en ella e incluso propiedad: si las anotas con el actor global, pasarán a ser "como parte" del actor.

@globalActor
actor ApiActor {
    static let shared = ApiActor()
}

@ApiActor
final class EmployeeAPI {
    //We can use it en another class
}
