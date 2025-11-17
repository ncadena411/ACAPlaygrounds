import Foundation

// La programación funcional se basa en la creación de funciones puras que operan sin efectos secundarios y producen el mismo resultado con los mismos argumentos.
// A estas funciones se les trata como ciudadanos de primera clase, permitiendo asignarlas a variables, pasarlas como argumentos a otras funciones y devolverlas como resultados de otras funciones.
// Gracias a las funciones de orden superior (como map, filter, reduce) y a la composición de funciones, se puede crear un flujo de procesamiento de datos declarativo muy legible y predecible.
// El principal problema que presenta es el manejo del estado mutable, ya que la inmutabilidad estricta dificulta representar operaciones que inherentemente requieren cambios de estado.
// Por este motivo, este paradigma se completa con patrones como los contenedores funcionales: a través de estructuras como callback se encapsula el estado y se transforma mediante funciones sin romper el principio de inmutabilidad.
// De esta forma, los programas pueden gestionar efectos secundarios y operaciones asincronas de manera controlada y componible, manteniendo las ventajas del razonamiento funcional mientras se adaptan a entornos que requieren mutabilidad.
// El elemento principal es el closure que se entiende como un bloque funcional.
