import Foundation

//Data Race

//SIN DATA RACE
// Tenemos dos hilos, pero usamos solo uno para lanzar dos veces la misma función, una tras otra..
// Aunque yo haga un un += 1, esto se descompone en varias instrucciones: lectura, almacenamiento en memoria, colocación en el registro de entrada de la CPU del valor actual de v1 y el 1, petición de la operación sumar, recoger el resultado, ponerlo en memoria, cambiar el puntero que apunta al antiguo valor de v1 a un nuevo lugar en memoria con el nuevo valor de v1 y fin.
// Como vemos, cada operación que hacemos en Swift supone varias instrucciones en código máquina.
// Pero si ejecutamos la función en un solo hilo, de forma serializada y la segunda ejecución nunca inicia hasta que acaba la primera, no tendremos ningún problema.

//DATA RACE
//Si ejecutamos la misma función de manera concurrente en dos hilos distintos, el funcionamiento de la CPU creará de forma aleatoria la condición de carrera al dividir los procesos y alternarlos entre ambos hilos.
// Esto implica que el hilo 1 y el hilo 2 están accediendo al valor en memoria de forma descoordinada. Ambos hilos leen el 1 antes de modificarlo para iniciar su propio proceso de aumentar el valor. Se viene el desastre.
// En el caso de ARM, solo un proceso de un hilo puede pasar a la vez por el gestor para ahorrar energía. En Intel pueden pasar varios a la vez desde distintos hilos. Pero en ambos casos, el problema de desincronía es inevitable.
// Escribimos en memoria de forma no sincronizada el mismo resultado que parte de la misma lectura porque un proceso no esperó al otro. Todo mal.
// Dos procesos que deberían haber ejecutado dos sumas de 1 y dar como resultado 3, en realidad han devuelto ambos 2. Tenemos un data race.

//Desde Swift 6 se prevé los escenarios donde puede darse un data race y los convierte en errores.
//No detecta que los haya porque es imposible: solo su posibilidad en dicho escenario.
//• Si usamos una variable global (mutable) tendremos un error.
//• Cuenta también el patrón singleton que permite pasar a través de él y con ello la modificación de propiedades mutables dentro de la instancia global de una clase.
//• Si accedemos a un dato mutable desde un closure que captura la instancia, igualmente error.
//• Algunas soluciones pasan por crear un dominio de aislamiento (actor global) o el usar el del
//sistema "atado" al hilo principal: el @MainActor.
//• De esa forma, si intentamos acceder a un dato atado a este u otro dominio, desde otro distinto:
//error. Ningún dato es accesible desde dominios distintos a donde está aislado.
//• Podemos usar actores para obligar a que el acceso a las propiedades esté bloqueado mientras se usan y conseguir que los datos funcionen en procesos concurrentes.
//• ° podemos crear nuestras propias clases que garanticen la seguridad de sus datos mutables
//entre distintos contextos y conformarlas al protocolo Sendable.
//• De hecho, todos los closures que capturen datos fuera de sí mismo, están definidos como
//@Sendable, por lo que no permitirán el acceso no seguro a datos mutables.
//• También podemos usar los métodos genéricos de bajo nivel Mutex, que permiten bloquear datos y liberarlos programáticamente.
//• Todo pasa por bloquear la lectura o modificación de datos mutables en tipos por referencia.
//
