import Foundation

// Una notificacion o una tarea pesada que NO se resuelve en tiempo real, es decir un proceso ASINCRONO, puede usar el patron callback para saber que ha de hacer cuando se responda.
// El sistema almacena un closure que contiene el callback de forma que lo reserva para ejecutarlo cuando el proeceso asincrono finalice
// Lo mas importante del patron callback es que debe estar retenido en memoria, esto puede provocar una fuga de memoria e incluso un hang en la app segun el caso
// El patron callback es programacion funcional, se basa en una funcion que reciba otra como parametro para ejecutarla cuando el proceso asincrono en cuestion termine.
// (Non-escaping) Si una funcion recibe otra como parametro y esta se ejecuta en el contexto de esta, decimos que es una funcion que NO escapa (No se guarda para ser ejecutada mas tarde)
// (escaping) Si una funcion recibe otra como parametro y esta se almacena fuera de su contexto para una ejecucion diferida, se dice que la funcion ESCAPA. y eso nos obliga a marcar el parametro escaping y a gestionar su posible fuga de memoria

//NO ESCAPA es un callback sincrono
//Es ejecutado en la misma funcion que lo recibe
final class Test {
    var x = 10
    
    //Solo una llamada
    func lanzarTemporizador(time: UInt32, msg: String) {
        sleep(time)
        print(msg)
    }
    //Callback basico
    //Proceso de finalizacion
    func lanzarTemporizador(time: UInt32, callback: () -> Void) {
        sleep(time)
        callback()
    }
    //Callback de inyeccion de parametro
    //Proceso de finalizacion
    func lanzarTemporizador(callback: (UInt32) -> Void) {
        let time = UInt32.random(in: 0...10)
        sleep(time)
        callback(time)
    }
    //Callback de inyeccion de parametro + retorno de funcion
    //Proceso intermedio
    func lanzarTemporizador(callback: (UInt32) -> String) {
        let time = UInt32.random(in: 0...10)
        sleep(time)
        let mensaje = callback(time)
        print(mensaje)
    }
}

let test = Test()
test.lanzarTemporizador(time: 5, msg: "OLA K ASE")
test.lanzarTemporizador(time: 5) {
    print("Ya acabe")
}
test.lanzarTemporizador { time in
    print("Este temporizador ha estado funcionando \(time) segundos.")
}

test.lanzarTemporizador { time in
    "Temporizador: \(time)"
}
