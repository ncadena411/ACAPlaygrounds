import Foundation

// Que es Clean Architecture

// Clean Architecture, ideada por Robert C. Martin, es un concepto de diseño de software que promueve la separación de componentes en distintas capas, con el objetivo de hacer el sistema más mantenible, escalable y fácil de entender.
// En Clean Architecture, se dividen las responsabilidades del software en capas concéntricas, donde cada capa tiene un propósito.
// Entidades: Objetos y reglas de negocio de los mismos.
// Casos de uso: La lógica de la app que coordina el flujo desde y hacia entidades.
// Adaptadores: Puente que conecta la lógica con la Ul, transformando los datos.
// Ul: La parte visual de la app.
// La clave es que Clean Architecture promueve la idea de no depender de frameworks específicos, lo que hace que el sistema sea menos vulnerable a cambios y respetar los patrones nativos del lenguaje o el framework.
// La inyección de dependencias y la testabilidad del software es un elemento clave en esta forma de organizar los proyectos.
// Clean Architecture establece unas normas o buenas prácticas, que luego nosotros aplicamos para adaptarlo al framework y al lenguaje de programación.

// Capa 1 Modelo o Entidad

//La primera capa de nuestra arquitectura será la definición de los datos: el elemento esencial de la app.
//Debemos definir cada fuente de datos y sus relaciones entre ellos. Solo usaremos struct, pero sin implementaciones.
//Si vamos a usar los datos como entrada y salida de datos en local o en red, deberán estar conformados con Codable para poder serializar a JSON y con ello cargar/recibir y grabar/enviar.
//La capa de modelo se compone de DTO (o modelo de transferencia de objetos) que es el dato que nos llega de fuentes externas.
//Por otro lado tenemos la capa de presentación de los datos que es la que usaremos con las vistas.
//En ocasiones puede ser el mismo, no es necesario que sea distinto.
//Esta capa tendrá la implementación de las transformaciones del DTO hacia la capa de presentación como propiedades calculadas del DTO.

// Capa 2. Casos de Uso: Interactor o Repositorio

// La segunda capa es el caso de uso: el elemento que permitirá la persistencia de los datos en local o en red, pues conecta las entidades con la propia app.
// Aquí vamos a usar un protocolo como base del repositorio de datos, para conseguir la inyección de dependencias de la persistencia de los datos, con el objeto de cambiar entre datos de producción y test o preview.
// Llamaremos repositorio a la capa que se encarga de la persistencia de datos en local (si existiera) e interactor a la capa de persistencia remota en red (si existiera). Podemos tener una y otra, una o la otra.
//Esta separación es vital para hacer test unitarios de la app o para los datos de la preview de las vistas cuando usamos Swiftul.
// El protocolo tendrá los métodos de carga y grabación de datos (descarga y envío si es una API) y así podremos crear tantos structs como sean necesarios para distintos tipos de datos para cada propósito.
// Adicionalmente, en caso de interactor, podría existir una capa al nivel de Entidad con la definición de la interfaz de red (URLs de carga o envío).

// Capa 3. Adaptador de interfaz

// La tercera capa es la capa de adaptador de interfaz: en Ulkit el controlador y en SwiftUl el ViewModel, que conectará el interactor y/o repositorio, así como los datos, con la capa de vista que representa la interfaz de nuestra aplicación.
// Depende la versión de Swiftul, podríamos dividir en distintas clases conectadas unas con otras (sin herencia) las distintas partes de un mismo adaptador o no.
// Lo importante es que aquí tendremos las capas que almacenan en memoria y crean toda la lógica de datos con nuestra app, y que provocarán que la Ul reaccione según funcione cada framework.
// Debemos tener muy claro que la forma de implementar esta parte es distinta en SwiftUl hasta ios 16 y desde iOS 17.
// Siempre usaremos clases finales para trabajar con las referencias y propagar los almacenes y la lógica a más de una pantalla a la vez.
// La propia arquitectura de SwiftUl nos proporciona elementos de entorno que nos permiten usar un patrón singleton escondido sobre una propiedad, para inyectar sobre cualquier pantalla un mismo ViewModel global a toda la app.

// Capa 4. View

//La última capa es la vista, que se encarga de mostrar los datos al usuario y proporcionarle la interacción a la app.
// Dependiendo del framework, la forma de manejar esta capa cambia porque cada interfaz se crea de formas distintas.
// No es lo mismo Swiftul hasta ios 16 que tiene más componentes y formas de reaccionar. Ni iOS 17 con macros.
// Y tampoco tiene nada que ver Ulkit con fuentes difusas que son reactivas, ni con fuentes normales. Tampoco construir la Ul con Storyboards o con XIB.
// Lo importante es que ningún botón o componente interactivo debe tener funcionalidad, más allá de una simple llamada a la lógica de negocio correspondiente para resolver su petición.
// La capa de vista conecta a la funcionalidad a través de los ViewModel en Swiftul o de los View Controller en Ulkit.
// La única lógica que deben contener es la que invoca funciones de otras capas pero
//nunca lógica compleja que no le pertenece.

// Acoplando al framework

//La arquitectura propuesta como Clean Architecture, será la misma solución para UlKit y para Swiftul.
// Las capas 1 y 2 no cambian, y la forma de adaptar la capa 3 sí será distinta según cada framework, pero en esencia es la misma.
// En el caso de Ulkit creamos un patrón singleton para dar cabida a lo que llamamos lógica de negocio, que contendrá (o puede contener) el almacén de datos que está conectado con el controlador de vista.
// La esencia es que siempre respetemos MVC como arquitectura única de funcionamiento del framework y acoplemos nuestra capa Clean a él.
// Con SwiftUl será igual pero con MVVM: la capa 3 será el ViewModel que conectará con la vista hasta ios 16. Y desde I7 podremos poner una capa intermedia
// De nuevo, lo esencial es respetar la forma de MVVM que Apple ha adaptado para dar soporte a SwiftUl en cada una de sus dos formales: ObservableObject y @Observable.
// Por lo tanto, lo que hacemos es acoplar nuestra forma de gestionar las capas anteriores de la app a la capa nativa del propio framework: siempre nativos.
// Pero la arquitectura NO es estático y puedes adaptarla como quieras, siempre que respetas la máxima de: no te pelees con el framework y con cómo funciona.


