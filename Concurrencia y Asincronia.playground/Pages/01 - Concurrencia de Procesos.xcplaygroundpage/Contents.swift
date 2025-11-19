import Foundation

// Cada núcleo de una CPU o GPU puede tener uno o varios hilos.
// En la arquitectura ARM de Apple Silicon cada núcleo maneja un solo hilo de ejecución para maximizar la eficiencia energética.
// Al trabajar con múltiples hilos, si añadimos una nueva tarea en concurrencia, esta se ejecutará de manera inmediata sin importar qué otras tareas haya en otros hilos, si dicho hilo está vacío. Si no, esperará.
// El sistema ofrecerá más o menos hilos al sistema en función de la batería del dispositivo u otros factores como la prioridad.
// Tenemos que pensar en la concurrencia como vías de un tren en paralelo, donde pueden circular varios trenes a la vez en la misma dirección pero nunca más de uno en la misma vía al mismo tiempo.
// Pero existe una restricción básica: un mismo pasajero no puede ir al mismo tiempo en dos trenes a la vez en distintas vías.
// Ese pasajero son los datos y si un mismo dato viaja al mismo tiempo en dos trenes distintos en distintas vías, tenemos un data race.
// La concurrencia estricta es el mecanismo que evita esto desde la compilación.

// La concurrencia en Apple Silicon los chips propietarios de Apple
// La gestión de la concurrencia en la mayoría de sistemas es un auténtico desastre pues solo es accesible por APls a muy bajo nivel.
// La falta de formación en estos conceptos implica que la mayoría del software use dos hilos solo: el principal para todo, normalmente sobrecargado, y el secundario para llamadas de red que es creado por el sistema automáticamente y de forma transparente al desarrollador.
// Para solucionar este problema intrínseco, los SoC Apple Silicon tienen un gestor de procesos basado en Machine Learning que gestiona los hilos.
// Este gestor analiza y determina el mejor destino en cada hilo para cada proceso de forma automática aunque todo esté programado para el hilo principal.
// Esto le permite al sistema que procesos no programados en concurrencia, no vayan a los primeros hilos como sucede en otros sistemas como Android o PC.
// El sistema aplica métricas estimadas a cada proceso, y decide enviarlo a núcleo de timiento (más rápido) o de eficiencia (más lento pero suficiente para la mayoría de tareas). Y va aprendiendo y generando nuevas métricas.
// Como un proceso puede migrar entre núcleos, Swift abstrae el concepto thread tradicional creando "dominios de aislamiento" (actors), donde se agrupan todas las operaciones que pertenecen a un mismo contexto lógico, independiente del núcleo físico que ejecute el código..
// El 'hilo principal" (MainActor) podría ejecutar operaciones en el núcleo 1 y continuar en el 4, pero Swift garantiza que el contexto lógico se mantiene, preservando el aislamiento de datos y la seguridad de concurrencia, evitando data races.

//Concurrencia Estricta Modo Swift 6

//Al igual que Swift ya tiene formas en sus pilares fundacionales para evitar de forma automática gran parte de los errores que pueden provocarse en un lenguaje de programación, desde la versión 6 se incluye uno muy importante: el data race.
// Dentro de cualquier lenguaje existen datos mutables cuyo acceso es compartido por cualquier recurso que quiera leerlos y/o escribirlos.
// Pero si dos procesos en dos hilos distintos, ejecutándose a la vez, intentan acceder al mismo dato al mismo tiempo, esto puede provocar una desincronia que genere un error en la integridad del dato que puede resultar fatal.
// Desde Swift 6, existen errores de compilación dados en tiempo de codificación, que detectan que un dato podría ser usado a la vez desde distintos dominios de aislamiento y provocar un data race: no que lo vaya a hacer, que en dichas condiciones puede darse.
// Esto solo sucede con datos mutables y solo en clases. ¿Por qué? Porque Swift funciona en paradigma de copia por valor en enum o struct: los datos se copian y por lo tanto no hay posibilidad que dos hilos distintos intenten mutar el mismo dato a la vez.
// Pero una clase tiene tipos por referencia: un mismo dato sí puede ser leído o modificado desde dos más hilos distintos a la vez porque comparten una misma referencia.
// Existen dos soluciones: o aislar el acceso a un dato en un solo hilo o bloquear el acceso al dato hasta que la operación en curso finalice.
// Si bloqueamos el dato a un hilo usamos dominios de aislamiento (como @MainActor) y si queremos que el dato sí pueda ser accedido a la vez desde múltiples hilos usamos actores, que bloquean los estados convirtiendo en serializado su acceso de forma obligatoria con colas de espera.
