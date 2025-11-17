import Foundation

// La programación declarativa se basa en la descripción del qué queremos obtener, en lugar del cómo conseguirlo, eliminando la necesidad de especificar pasos secuenciales para resolver problemas.
// En Swift, este paradigma se implementa mediante Result Builders, que permiten construir estructuras complejas a través de declaraciones anidadas que se transforman automáticamente en el resultado final deseado.
// Es la base de Swiftul, el mayor exponente de este paradigma en Swift, donde podemos declarar interfaces complejas mediante composición de vistas sin preocuparnos por los detalles de implementación que ocurren "bajo el capó".
// El principal problema que presenta es la falta de acceso directo a los componentes internos, ya que una vez declarada la estructura, no existe una referencia manipulable a cada elemento individual, dificultando interacciones complejas.
// Por este motivo, este paradigma se completa con el sistema de estado y binding: a través de property rappers que permiten controlar el flujo unidireccional de datos sin romper el modelo declarativo, aislando estados a clases a través de propiedades.
// De esta forma, las vistas pueden reaccionar automáticamente a cambios en los datos subyacentes sin necesidad de código explícito para actualizar la interfaz, creando aplicaciones más predecibles y menos propensas a errores.
// De esa forma, minimizamos el uso del estado y la mutabilidad.
