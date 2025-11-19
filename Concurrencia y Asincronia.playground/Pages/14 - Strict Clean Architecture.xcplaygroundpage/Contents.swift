import Foundation

//Si estamos pensando en crear una capa de red aislada que garantice que todo funcione correctamente y con posibilidad de inyección de dependencias para testing o datos para la preview en SwiftUl, es muy sencillo.
// Solo hay que aislar los métodos de carga o envío de información dentro de un struct.
// Por ser struct ya es @Sendable y lo conformaremos a un protocolo que también será de tipo Sendable con los métodos de red que queramos usar.
// Al cerrar el protocolo a Sendable, evitamos que nada que no lo sea pueda conformarse al mismo y garantizar los tipos que inyectaremos al ViewModel.
// Al cumplir esa condición, podremos realizar un método que invoca la carga y su correspondiente inyección de dependencias sin ningún problema.
// Solo queda un asunto: la instancia del ViewModel en la vista, es una instancia de tipo @MainActor (aunque el tipo en sí del ViewModel no lo sea).
// Aquí tenemos dos opciones: o marcas todo el ViewModel como @MainActor para hacer la carga asincrona desde el init (y garantizar el acceso a self)
// O hacer la carga desde la View con el modificador. task.
// Donde para poder llamar al método, este sí ha de estar marcado como @MainActor, pero no así todo la clase si no queremos cargar en exceso el hilo principal.


