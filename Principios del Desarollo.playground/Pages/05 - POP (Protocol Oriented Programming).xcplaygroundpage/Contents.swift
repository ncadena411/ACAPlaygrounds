import Foundation

// La orientación a protocolos se basa en la creación de tipos de datos struct que crean tipos por valor, y no por referencia.
// A estos structs se les marca una serie de condiciones obligadas de métodos y propiedades, estableciendo características de su abstracción a través de la obligatoriedad de incluir estos.
// Gracias a la herencia de protocolos (suma de requisitos) y a la capacidad de un struct de conformarse a más de un protocolo, se puede crear una estructura múltiple de datos muy eficiente.
// El único problema que presentan, es el hecho que al ser un protocolo una obligación de especificación, pero no de implementación, hay que repetir mucho código para dar la misma implementación a distintos tipos.
// Por este motivo, este paradigma se completa con el patrón de extensiones: a través de extender protocolos se le proporciona al tipo una implementación por defecto para sus obligaciones contractuales con el protocolo.
// De esta forma, los tipos que se conformen al protocolo que no incluyan implementación para una de sus obligaciones (propiedad calculada o método) usarán la implementación por defecto que proporciona la extensión.
