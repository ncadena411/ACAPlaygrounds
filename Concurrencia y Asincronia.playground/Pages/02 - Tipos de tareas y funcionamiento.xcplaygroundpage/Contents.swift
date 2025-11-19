//Tareas serializadas en el hilo principal


// Dominio de Aislamiento en background, lo podemos atar a un hilo

// Todos los hilos funcionan de manera serializada: ejecutan las tareas una a una, incluido el principal.
// Cuando ponemos distintas tareas en distintos hilos a la vez, tenemos ejecución en concurrencia, pero dentro de cada uno de sus hilos funcionan como serializadas.
// Un dominio de aislamiento es un hilo: es impedir que un dato mutable por referencia sea accesible (para lectura o modificación) desde cualquier hilo (contexto) que no sea aquel en que está aislado.
// Al funcionar estos de forma serializada, nadie que quiera leer o escribir el dato puede hacerlo si el proceso anterior no ha finalizado.

// Buenas practicas en tareas pesadas
// El hilo principal (@MainActor) es el encargado de ejecutar la interfaz de la app.
// Si este encuentra una tarea pesada (más lenta), la Ul dejará de responder correctamente.
// Todo porque la tarea lenta parará la ejecución serializada del mismo hilo donde corre el código principal y con ello la interfaz de nuestra app.
// Este error es muy común entre los desarrolladores у provoca 1 apps con mala respuesta y rendimiento.
// Las buenas prácticas nos dicen que tenemos mover esa tarea lenta a otro hilo.
// En ese otro hilo, fuera del main, podrá ejecutarse sin entorpecer a la interfaz ni a la app y lo único que nos interesa entonces es el resultado de dicha tarea lenta.
// Una vez la tarea lenta termina, buscamos el dato donde volcar el resultado e inyectamos este sin afectar al rendimiento o que dicho resultado estuviera aislado al contexto del hilo principal por concurrencia estricta. La cola del hilo principal se activa desde un Task marcado al @MainActor.
// Gracias a las nuevas medidas de concurrencia estricta, no se puede refrescar un dato que esté aislado al hilo principal desde uno en segundo plano, un error muy común que generaba históricamente errores en tiempo de ejecución que muchas veces eran ignorandos por los desarrolladores.

// Los problemas de la concurrencia

//La concurrencia presenta tres problemas básicos en su concepto:
//1. Data race (carreras de datos)
//2. Inversión de la prioridad
//3. Deadlock (bloqueo mortal)
// Ni NSOperation ni GCD pueden evitar el data race de forma automática.
// Debemos usar buenas prácticas y/o funciones de bajo nivel de C (accesibles desde Swift) que bloquean el acceso a datos.
// Con Async/Await podemos hacerlo usando actores.
// Los actores son un tipo de clase sin herencia que aisla el acceso a todas sus propiedades mutables y a los métodos que las usan sea cual sea el hilo de origen.
// Así mismo, podemos atar un dato a un dominio de aislamiento, un actor global, que en esencia es un actor que "ofrece" su propio aislamiento de datos a todos los métodos, clases o propiedades que se etiqueten a él. El más conocido es el @MainActor.
// Adicionalmente, si queremos garantizar que un dato es seguro de pasar entre distintos dominios (porque sus datos no son mutables, funcionan por copiar por valor o tienen sus métodos apropiados de bloqueo) tenemos un protocolo que garantiza que las propiedades mutables de una clase son seguras: el protocolo Sendable.
