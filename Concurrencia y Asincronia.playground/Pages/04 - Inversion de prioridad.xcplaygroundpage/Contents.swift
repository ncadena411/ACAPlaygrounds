import Foundation

// La inversión de prioridad ocurre cuando bloqueamos recursos para evitar un data race, pero eso provoca que procesos con prioridad menor establecida acaban antes que los más importantes.
// Imagina que iniciamos una tarea de prioridad baja que bloquea un recurso para evitar una condición de carrera y solo tenemos un hilo disponible para trabajar porque hay poca batería.
// Si se inicia una tarea de prioridad media, la tarea de prioridad baja se detiene.
// Pero dicha tarea que no ha acabado, ha dejado bloqueado el recurso o dato que necesitaba hasta terminar.

// La tarea de prioridad alta no puede seguir: necesita un dato que está bloqueado.
// Se suspende, lo que deja el hilo libre para que la tarea de prioridad media continue.
// Tenemos que entender que las tareas se dividen en subtareas a nivel atómico de proceso, por lo que una tarea puede tener 10 pasos y suspenderse en el número 4 (guardando todo lo que ha usado, modificado o generado) y luego continuar por el 5 en adelante cuando pueda.

// Acabada la tarea de prioridad media, se intenta arrancar la de prioridad alta que es la siguiente en la cola por la propia prioridad.
// Pero como el recurso sigue bloqueado, no se puede y entra la siguiente en la cola: la de prioridad baja.
// La tarea de prioridad baja termina y libera el recurso.
// Ahora la siguiente en cola vuelve a ser la de prioridad alta.
// El recurso está desbloqueado y por lo tanto arranca, bloquea y continua.

//Una de las primeras consecuencias de bloquear recursos para evitar un data race es una inversión de prioridad.
// La solución es automática en el lenguaje: se eleva la prioridad de las subtareas de bajo nivel cuando estas bloquean un recurso con el objeto que termine lo antes posible y lo libere. Luego vuelve a su prioridad original.
// Todos los contextos en segundo plano tienen una prioridad por defecto o la que nosotros asignemos, y el hilo principal tiene la prioridad más alta que tú no puedes fijar.
// La prioridad es transitiva, por lo que se propaga a las tareas dentro de tareas, salvo que hagamos una desunida.
// ¿Y cómo se crea una tarea? Basta usar Task y darle un closure que ejecutará en un contexto distinto a donde se ha definido esta Task.
// Se puede establecer igualmente la prioridad de la misma o dejarla por defecto que será la prioridad intermedia.
// Un Task se puede aislar a un dominio de aislamiento o actor global, simplemente anotando este con el prefijo @ antes del in de la cabecera.

//Que es una prioridad en las tareas?

// Las prioridades para las tareas son 3: alta, media y baja.
// Una tarea alta tiene una prioridad por valor de orden de 25 y está destinada a procesos que tienen que ver con la respuesta de la app.
// Cualquier tarea que esté interactuando con el hilo principal y esté modificando la UI y/ o tenga al usuario a la espera de su conclusión (la florecita giratoria), deberá ser alta (high) para tener el máximo de prioridad posible.
// La prioridad high también tiene el nombre de userinitiated por compatibilidad con los valores que se usaban en GCD.
// El nivel por defecto es el medio (medium) que se establece para tareas que el usuario no sabe que se están ejecutando, como actualizaciones de datos en segundo plano, procesos de indexación, envío de métricas a una API REST, etc....
// Por retrocompatibilidad también es conocida como utility con un valor de 17.
// La tarea de menor prioridad es la baja (low), que representa la tarea solo se ejecutará cuando no haya nada más en ese hilo (u otros) en prioridades mayores.
// Por compatibilidad también se llama como background y tiene un valor de 9.
// Por último la no especificada o unspecified tiene un valor de 0 y no suele usarse.
// Si no ponemos ninguna en la Task, se usa la intermedia por defecto.
