import Foundation

// El modelo de concurrencia nativo de Swift es async-await, que une GCD y Combine en uno.
// Se compone de dos instrucciones que marcan cuando el sistema debe esperar la respuesta de una función.
// No para el código, suspende el hilo de ejecución liberando los recursos y esperando el resultado.
// Cada llamada de tipo await a una función async, divide esta en varias de forma transparente.
// El código continua en una "nueva" función cuando el await contesta, pero nosotros no vemos cambios.
// Lo que nosotros vemos es un código contínuo, sin pausas, con llamadas await que fuerzan al sistema a esperar una respuesta en dicha línea y no avanzar hasta que esta llega.

// Todo el código con Async/Await es estructurado. Línea a línea, sin división de contextos ni funciones una dentro de otra.
// Al igual que sucede con throws que cualquier llamada a un método o propiedad de este tipo debe anteponer en la llamada try, async await es similar. Hay que marcar el elemento async y solo se le podrá llamar anteponiendo await.
// Cuando el código alcanza una llamada con await a algo async, la invocación es encolada al momento y si tiene recursos disponibles, será lanzada parando el código hasta obtener respuesta.
// Un await siempre esperará a la función async con todos sus await dentro.
// No puede lanzarse nada que sea asyn desde un contexto que no esté marcado en concurrencia.
// Los contextos en concurrencia están o en un método o propiedad marcada como async, o dentro de un ámbito creado por la instrucción Task.
// También pueden ser usados desde un ejecutor de código (executor) dentro de un actor para proteger la concurrencia del proceso.

// Hablamos de concurrencia estructurada cuando usamos las Task o los métodos y propiedades marcados como async
// Es estructurada porque usa el patrón de programación estructura, una tarea tras otra. Una línea tras otra.
// Cada llamada async dentro de un ámbito Task se ejecuta en un hilo distinto o esperará a tener disponibles, encolado para lanzar la tarea.
// De una manera u otra, al llegar a un await el sistema parará el código y esperará el fin de la ejecución del elemento async.
// Si este a su vez, dentro, tiene otros elementos también await, harán lo mismo, encadenando esperas a distinta profundidad.
// Pero cada elemento async con su await se ejecutará siempre en distintos contextos (hilos) del anterior.
// Por este hecho de parar la ejecución y esperar, el hilo principal está prohibido para este tipo de procesos.

// This is async because they wait in the await.
// Task(priority: .background) {
//    async let imagen1 = getImage(url: url)
//    async let imagen2 = getImage(url: url)
//    async let imagen3 = getImage(url: url)
//    
//    try await print(imagen1, imagen2, imagen3)
// }
