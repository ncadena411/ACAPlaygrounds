import Foundation

//La programación concurrente en Swift se basa en el modelo de concurrencia estructurada, que organiza el trabajo asincrono en jerarquías claras y predecibles, evitando problemas tradicionales como condiciones de carrera y deadlocks.
// Este paradigma se implementa mediante las palabras clave async/await, permitiendo escribir código asincrono con una sintaxis casi idéntica a la del código sincrono, sin necesidad de callbacks anidados o bloques de finalización.
// Gracias a los actores, un nuevo tipo de dato que garantiza acceso exclusivo a su estado mutable interno, Swift proporciona aislamiento de memoria sin bloqueos explicitos, permitiendo compartir estado entre tareas de forma segura y eficiente.
// El principal problema que presenta es el manejo de condiciones de carrera sutiles, ya que incluso con async/await y actores, todavía es posible crear patrones de interbloqueo o introducir errores en el ordenamiento de las operaciones concurrentes.
//Por este motivo, este paradigma se complementa con la concurrencia estricta en Swift 6: a través de un sistema de tipos más riguroso y comprobaciones en tiempo de compilación, el lenguaje identificará automáticamente usos inseguros de valores mutables compartidos entre contextos concurrentes.
// De esta forma, los programadores podrán crear aplicaciones altamente concurrentes con garantías de seguridad impuestas por el compilador, eliminando clases enteras de errores antes de la ejecución y permitiendo aprovechar al máximo el paralelismo sin sacrificar la integridad de los datos.
