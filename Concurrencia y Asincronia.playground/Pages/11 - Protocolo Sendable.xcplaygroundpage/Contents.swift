import Foundation

//El protocolo Sendable indica que un tipo es seguro para ser pasado entre distintos dominios de aislamiento.
// Esto se consigue a través de inmutabilidad (tipos por valor) o mecanismos de aislamiento controlado (como actores). Mientras se lee o toca el dato, este debe estar bloqueado para que nadie más acceda a él.
// Los structs, enumeraciones y todos los tipos naturales del sistema (Int, String, etc...) son Sendable, al ser tipos de datos por valor y copia por valor.
// Si creamos una clase y dentro de la misma no hay ninguna propiedad mutable (ningún var), dicha clase podrá conformarse con Sendable y podrá ser usada sin problema para pasar y/o capturar datos entre distintos contextos.
// Pero si queremos que una clase con una variable (o varias) sean Sendable, tenemos que bloquearlas con garantías para que cumplan el protocolo.
// Podemos crear un actor privado dentro de la clase que gestione la mutabilidad (aunque los accesos serán async).
// Y es posible usar mecanismos de bajo nivel como NLock o Mutex o Atomic pero Swift promueve el uso de abstracciones de más alto nivel como actores para mejor seguridad y claridad del código.
