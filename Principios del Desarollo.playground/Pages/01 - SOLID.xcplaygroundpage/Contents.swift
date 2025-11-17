import Foundation

// Son 5 pautas centradas en como la programacion Orientada a Objetos debe ser usada para crear sistemas mas comprensibles, flexibles y sobretodo mantenibles en el tiempo
// Single Responsability Principle: Cada clase debe tener solo una tarea o responsabilidad. Esto facilita la comprension, prueba y mantenimiento
// Open/Closed Principle: Donde las entidadades como clases o funciones deben estar abiertas para extension pero cerradas para la modificacion. Solo para herencia de objectos en Swift NO se utiliza mucho!
// Liskov Substitution principle: Donde las subclases deben poder substituir a sus clases padre sin afectar el funcionamiento de la app. Una clase hija nunca debe dejar que una clase padre deje de funcionar (Como Swift es orientada a protocolos este no sirve)
// Interface Segregation Principle: Donde se debe evitar que una clase implemente metodos o elementos que no va a utilizar para evitar dependencias innecesarias en el codigo en partes donde no seran necesarias. (Aplicable a Swift)
// Dependency Inversion Principle: Las partes mas altas de tu app NO deben depender de las de bajo nivel, pues deben de abstracciones que permitan desacoplar el codigo para hacer las dependencias mas flexibles entre distintas partes de la app. En Swift esto se hace a travez de protocolos para que todo sea mas facilmente escalable e intercambiable de ser necesario por ejemplo hacer un mock para tests de un protocolo en particular.

