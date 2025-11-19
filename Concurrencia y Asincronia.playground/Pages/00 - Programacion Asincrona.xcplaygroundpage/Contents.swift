import Foundation

// Cuando en un programa ejecutamos una instrucción o una llamada, esta sucede en tiempo real y en el contexto principal o main.
// Si tengo dos instrucciones, hasta que la primera instrucción no se ha procesado, no pasa a ejecutar la segunda. Una a una.
// Todas las instrucciones se ejecutan secuencialmente.
// Este concepto se conoce como serialización: las instrucciones se ejecutan una tras otra en orden secuencial.
// Pero, ¿y si una línea de código supone un tiempo más largo e impide que la app funcione con normalidad y responda como debería?
// Elementos como la interfaz de la app funcionan serializadamente y en el mismo contexto main, incluso la detección de interacción del usuario o la carga de elementos desde el almacenamiento.
// Si una línea de código (o proceso de varias líneas) tarda un tiempo "mayor de lo normal" parará todo el contexto main y la app dejaría de responder a las interacciones del usuario, animaciones y demás.

// El contexto main es el único que existe en una app si no usamos algún tipo de funcionalidad que permita "salir" de este contexto y usar otro distinto.
// Cuando hacemos una petición de un dato que está en internet, el sistema por sí solo usa un contexto distinto al main sin que nosotros hagamos nada, creando concurrencia.
// Un proceso que se ejecuta en concurrencia, se ejecuta en otro contexto distinto. Cualquier sistema tiene hilos (threads) y estos permiten ejecutar tanto el contexto main como el resto, a la vez.
// Este paso automático no ha permitido en muchas ocasiones dar a entender a los programadores lo que es la concurrencia, de forma que es muy común encontrar desarrollos que no la usan.
// No solo los procesos que piden cosas a internet deben ir en concurrencia: también cualquier tarea pesada que pueda entorpecer al contexto main.
// Asincronía es invocar un proceso que supone un tiempo largo, lanzado en un contexto en concurrencia o desde main, pero que luego usa un contexto distinto al primero para esperar el resultado, en un tiempo indeterminado.

//Si asincronía es diferir en el tiempo la recepción de una respuesta, ¿cómo se recoge entonces dicha respuesta?
// En Swift tenemos 3 patrones: el patrón callback, el modelo de concurrencia async-await y el uso de la librería Combine.
// Callback se basa en un closure que se envía como parámetro y que será ejecutado cuando la tarea termine.
// Async-Await suspende el código mientras espera la respuesta, y usa un patrón estructurado (línea a línea).
// Combine usa publicadores que emiten hacia un suscriptor cuando hay respuesta, ejecutando dos callbacks: respuesta y finalización.
// Hasta aquí hablamos de procesos asíncronos, pero no podemos olvidar que el proceso asíncrono por excelencia es la llamada de red.
// Una llamada de red se realiza con la API URLSession, que funciona en segundo plano automáticamente para no entorpecer la app.

