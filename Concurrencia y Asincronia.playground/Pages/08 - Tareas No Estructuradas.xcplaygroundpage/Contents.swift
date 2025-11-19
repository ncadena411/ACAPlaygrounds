import Foundation

//Hablamos de tareas no estructuradas cuando usamos el tipo Task como un constructor que guardamos en un tipo de dato.
// Las Task pueden ser creadas tal cual, pero también pueden guardarse como un tipo Task genérico similar a un tipo Result.
// El tipo Task tendrá dos genéricos, el de la izquierda lo que devolverá la Task en caso de ir todo correcto y el de la derecha el tipo Error que será lanzado en caso que hubiera uno.
// Si el Task no va a lanzar errores, entonces la parte del error sería del tipo Never que indica que nunca los lanzará.
// Una tarea de tipo Task puede ser tratada en un contexto distinto e incluso puede ser cancelada.
// Las tareas pueden cancelarse, siempre y cuando no hayan iniciado ya.
// El tipo Task tiene dentro un tipo Result y una propiedad va lue que es su valor correcto en caso de no haber errores, pero no pueden leerse fuera de un contexto async
