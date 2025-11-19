import Foundation

// Un deadlock se puede prevenir con el uso de la prioridad, con buenas prácticas específicas o con herramientas concretas del sistema.
// Podemos usar dependencias entre operaciones o usar un tiempo de espera tijo (un timeout) que cancelará la operación pasado un tiempo prudencial.
// Una dependencia previene que una operación no pueda iniciarse hasta que la primera acabe: básicamente serializar operaciones cuando usan datos compartidos, aunque sea concurrente.
// Los actores atomizan sus operaciones de forma que si hacemos una lectura y luego una escritura, se bloquea solo esa operación y no todo el flujo relacionado con una operación múltiple, para intentar evitar esto.
// No obstante, un deadlock no puede ser prevenido ni por los actores. Depende al final de nuestras buenas prácticas y el uso de prioridades.
// Desde ios 18, Apple ofrece la librería Synchronization con la API Atomic, que permite operaciones con valores mutables que sean concurrentemente seguras.
// Atomic nos ofrece 5 modos de funcionamiento para ordenar las operaciones en concurrencia y garantizar con ello la operación a realizar, desde . re laxed para bloquear operaciones sin importar el orden hasta. sequentiallyConsistent para garantizar un orden estricto incluso entre acceso de otro hilos.
