//Missing

// Un grupo de tareas es una secuencia de procesos asincronos.
// A través de un método global withTaskGroup nos permite crear una cola de tareas que podemos ir inyectando para que un número indeterminado de tareas asíncronas sean lanzadas en concurrencia.
// Las tareas pueden lanzar errores o pueden no lanzarlos.
// Cuando creamos el grupo de tareas, hay que entregarle un closure que obligará a esperar con el withTaskGroup a todas las tareas.
// Dicho closure recibe un grupo al que encolar todas las tareas asincronas que queramos, usando el tipo Task.
// Todas las tareas de un grupo tienen que devolver siempre el mismo tipo de dato, aunque podríamos tener un tipo de dato que se recibe en la tarea y otro que devolverá el propio withTaskGroup.
// El grupo es una secuencia asincrona que debe ser iterada en un for-loop para obtener los resultados de cada tarea.
// Si no hay suficientes hilos disponibles, las tareas encoladas esperarán.

// Tareas Desunidas

//Las tareas desunidas son un tipo de tareas desestructuradas aisladas del contexto donde se han creado.
// Se crean con el constructor Task. detached.
// No heredan el actor o contexto de ejecución de donde se crean.
// No se cancelan cuando su contexto creador termina o se cancela.
// Tienen su propio contexto de prioridad y herencia.
// Se suelen usar para operaciones que deben continuar independientemente del ciclo de vida de la Ul.
// O procesos en background que no deben ser interrumpidos pase lo que pase con el resto de tareas o incluso el contexto que la creó.
// También para operaciones de limpieza o mantenimiento
// Y para sincronización de datos que debe continuar aunque el usuario salga fuera de la pantalla que lo lanzó, por ejemplo.
