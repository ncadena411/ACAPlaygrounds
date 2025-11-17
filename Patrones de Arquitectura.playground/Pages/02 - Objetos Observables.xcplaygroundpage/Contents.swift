import UIKit

// Objetos Observables - (Los View Models) iOS 16 or below

// Un objeto observable es una clase final conformada con el protocolo Observableobject.
// Este protocolo no tiene obligaciones: incorpora una propiedad objectwillChange.
// Esta propiedad es un publicador que envía señales al invocar su método • send.
// Cuando una propiedad marcada de forma específica en el ViewModel cambia su valor (una variable) envía una señal al objectwillChange que llama a la View.
// Emite antes del cambio, para permitir el ciclo de vida de la vista y valorar qué subvistas han cambiado, conectando View Model y Ul.
// En esencia, permite aislar propiedades similares a @State en clases fuera de la vista, para crear nuestra arquitectura.
// Siguiendo una arquitectura limpia, no deberíamos tener propiedades de estado que tengan que ver con la funcionalidad de la app (su capa de negocio), solo con el ciclo de vida de la propia app.
// Los ViewModel (ObservableObject) permiten aislar estados de la capa de negocio fuera de la vista para separar y reutilizar un ViewModel en varias vistas.

// Propiedades publicadas o @Published

// La forma de determinar qué propiedad provocará que el objectWillChange actúe, es marcarla con @Published.
// Una propiedad dentro de un Observableobject marcada con el property wrapper @Published, actúa como una propiedad @State.
// Mientras @State es usado en la parte de la Ul, @Published se usa en la parte del ViewModel.
// La instancia de un Observableobject incluye un tipo enlazable
// (Bindable) que permite acceder a los enlaces (@Binding) de cada propiedad @Published
// Si llamamos a la propiedad viewModel podremos llegar a sus propiedades @Published para poder mostrar su contenido en la vista y que esta se refresque cuando cambie su valor.
// Si llamamos a la propiedad $viewModel accederemos a la referencia
// @Binding de cada propiedad @Published y podremos enviarla como referencia a una vista hija.

// Objeto Observado U @ObservedObject

// Para que una instancia de una clase conformada con
// Observabledbject funcione, debe estar instanciada en la vista sobre una propiedad @observedobject.
// Un objeto observado es la instancia de un ObservableObject y permite trabajar con sus propiedades @Published como si fueran @State de la vista, haciendo reaccionar a la Ul a su cambio.
// Pero ojo: la instancia del @observedobject tiene un comportamiento peculiar y "algo confuso", al menos hasta iOS 16.
// Si los cambios en la vista los provocan los @Published del @Observedobject, la instancia permanece inalterada.
// Si un elemento externo al @observedobject provoca un refresco de la vista, el @observedobject se reinstanciará volviendo a ejecutar su inicialización y perdiendo cualquier valor almacenado.
// El ciclo de vida de cada @observedobject está unido al de la vista que lo utiliza: refresco de la vista, re-instancia de objeto observado.

// Objetos de estado (ViewModel Global)

// Si queremos usar una misma instancia de un Observableobject en distintas vistas, un aobservedobject no nos sirve.
// Cada @Observedobject sería una instancia distinta y no habría consistencia en los datos. Cada objeto observado está unido a una vista.
// La solución para usarlo en varias es usar un @Stateobject.
// Un objeto de estado es una instancia de un Observableobject detrás de un patrón singleton, que retendrá la instancia para asegurar que una misma
//instancia es usada por toda la app.
// Para inyectar como dependencia el objeto de estado necesitamos usar un objeto de entorno como modificador que inyectará la dependencia dentro de la jerarquía de vistas.
//Usaremos un modificar • environmentObject para inyectar la instancia.
// Luego usaremos el property wrapper @EnvironmentObject para recuperar esta dependencia y usarla en cualquier vista de la jerarquía, sea cual sea la
//"profundidad" de la misma.
