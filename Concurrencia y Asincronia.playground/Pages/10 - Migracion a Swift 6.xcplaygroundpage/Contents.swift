import Foundation

//Swift 6.0
// ¿Cómo hacemos la migración de un proyecto al modo de lenguaje Swift 6?
// Primero debemos activar en Build Settings la opción Swift Concurrency Checking a
// Complete con el lenguaje aún en Swift 5 y/o activar Approachable Concurrency de Swift
// 6.2. Podemos hacer ambas o solo una, ya que Swift 6.2 es la versión 6 con "extras".
// Esto activará todas las comprobaciones y mostrará como warnings todo lo que sería error si ponemos el lenguaje Swift Language Version en 6.
// El proceso ahora es ir analizando caso a caso y modificando el código para que estos warnings vaya desapareciendo, aplicando actores, protocolo Sendable, concurrencia, etc...
// Este proceso puede hacerse módulo a módulo de manera independiente: primero packages propios y luego la app completa.
// Una vez se ha corregido todo el código y ya no hay warnings debemos activar el modo
// Swift Concurrency Checking a Complete y veremos que todo compila sin problema ya que hemos resuelto todos los problemas de concurrencia y ya tenemos nuestro módulo o proyecto en Swift con concurrencia estricta.
// Si activamos la Concurrencia Accesible de Swift 6.2, activará menos warnings y cambios a realizar. De hecho, Apple recomienda que si estamos en Swift 5, pasemos directamente a
// 6.2 porque el paso es menos "doloroso" y más fácil de asumir.
// Pero ojo: porque la Approachable Concurrency de Swift 6.2 tiene sus peculiaridades.

//Swift 6.2
//Swift 6.2 viene a mejorar la concurrencia estricta dividiéndola en dos modos de aislamiento: "nonisolated" y "Main Actor".
// El modo en que se funcionaba con Swift 6 es el denominado "nonisolated" y será el modo que tendrán proyectos creados en versiones anteriores a Xcode 26.
// Una vez en Swift 6.2 (retrocompatible a todas las versiones soportadas por esta versión, que son 15, 16, 17,18 y 26) tenemos la opción de activar una suite de 5 flags de compilador que creerán el nuevo modo por defecto para todos los proyectos creados en la versión 26: Approachable Concurrency.
// La opción más importante que activa la concurrencia accesible es (nonisolated)nonsending. En Swift 6, si llamo a un método async, este escapa al ejecutor global donde se le busca un nuevo contexto aislado de ejecución (estuviera o no atado a un contexto concreto como @MainActor). Con esta opción, el método asyne seguirá en el mismo contexto aislado de quien lo ha llamado. Solo si se anota el método llamado como @concurrent se hará el comportamiento anterior.
// Con Infer Sendable todos los tipos sean Sendable marcarán automáticamente todos sus métodos con el protocolo y los key-path literales que hagan referencia a elementos serán también Sendable.
// Con Infer Isolated Conformance cuando anotabas una clase o struct con un aislamiento y este usaba un protocolo, dicho protocolo no heredaba el aislamiento. Ahora sí.
// Con Global Actor Isolated Types todo lo que hasta ahora tenía que marcarse como inseguro por no estar preparado para concurrencia estricta (muchas librerías de la propia Apple) y debían marcarse nonisolated(unsafe) ahora se hacen @MainActor por defecto.
// Por último Disable outward actor isolation inference permite que el uso de un property wrapper como @Statelbject no haga que todo el aislamiento de este se herede por la vista.

//Soluciones mas comunes en Swift 6
// Las variables globales mutables o incluso el patrón singleton ya no funcionan. Hay que hacerlas let si se puede y el patrón singleton aislarlo a un actor.
// Cualquier dato mutable que pase entre hilos hay que hacerlo Sendable si no lo es o usar actores para aislarlos. O actores asíncronos o actores globales.
// Cualquier clase compartida entre hilos, deberá ser convertida a actor o aislarla en un actor global (lo que incluye al hilo principal). En SwiftUI y UIKit, todo lo que trabaje contra elementos de la ul deberá estar aislado al @MainActor, ya que sus elementos ya lo están.
// Todo el trabajo con red tiene que estar aislado con actores, actores globales o usando tipos que sean Sendable y garanticen la espera al acceder a los datos con un await o derivado.
// Si tenemos librerías antiguas binarias sin actualizar y/o que no sean nuestras, hay que marcarlas en el import como @preconcurrency.
// Si usamos alguna propiedad o clase del sistema que nos da error porque no está adaptada o el compilador no puede verificar (por ejemplo PDFDocument) hay que marcarla como Sendable no comprobada con carácter retroactivo: @retroactive @unchecked Sendable.
// La retroactividad indica al sistema que es un binario que no podemos modificar y que "suponemos" que controla la concurrencia. Por lo que añadimos el no chequeado para que acepte Sendable cuando puede que no lo sea.
// Solo en casos muy aislados podemos marcar algo como nonisolated (unsafe), que activa el modo no seguro y obviamente el obviar la concurrencia (como un ! en un opcional).

//Soluciones mas comunes en Swift 6.2
//En Swift 6.2, el proceso ahora es aprovechar las nuevas capacidades automáticas y solo resolver casos específicos que sigan generando problemas, aplicando las estrategias modernas de aislamiento y Sendable.
// Las variables globales mutables o el patrón singleton aprovechan Default Actor Isolation y dejan de dar error, pero debemos tener claro si queremos que ese aislamiento al hilo principal sea para todas ellas o no.
// Cualquier dato mutable que pase entre hilos hay que seguir haciéndolo Sendable si no lo es o usar actores para aislarlos, pero isolated conformances nos ahorrarán mucho trabajo con ello.
// Las async functions ya no saltan automáticamente de contexto, reduciendo muchos problemas que existían antes, por lo que habrá que decidir qué queremos que sea realmente @concurrent y mantener las mismas precauciones que con Swift 6 para esos casos concretos.
// Todo el trabajo con la Ul estará aislado al @MainActor con Default Actor Isolation activado. Debemos decidir si algo que trabaje con la Ul queremos que sea o no @concurrent.
// Todo el trabajo con red se beneficia de que las asyne functions que procesan los resultados de red mantienen el contexto del actor, eliminando saltos innecesarios al global executor para procesamiento que puede quedarse en el actor original. Pero URLSession está marcado como @concurrent.
// Hay que seguir teniendo en cuenta (aunque pasará en menos ocasiones) el @preconcurrency (ahora sobre todo con librerías de terceros) y el Sendable no comprobado con carácter retroactivo: @retroactive @unchecked Sendable. La retroactividad indica al sistema que es un binario que no podemos modificar y que "suponemos" que controla la concurrencia, añadiendo el no chequeado para que acepte Sendable cuando puede que no lo sea.
// Solo en casos muy aislados marcaremos noniso lated (unsafe), que activa el modo no seguro y obviamente obvia la concurrencia, pero con Approachable Concurrency estos casos son muchos menos.
