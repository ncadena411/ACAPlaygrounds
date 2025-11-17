import Foundation

var callbacksFuera: [() -> Void] = []

final class Test {
    var x = 10
    var callbacks: [() -> Void] = []
    
    //Sincrono - no escapa
    func lanzarTemporizador(time: UInt32, callback: () -> Void) {
        sleep(time)
        callback()
    }
    
    // ASINCRONO
    // Escapa porque su ciclo de vida es mayor que la funcion que lo contiene
    @MainActor
    func lanzarTemporizadorLuego(time: UInt32, callback: @escaping () -> Void) {
        sleep(time)
        // Makes a copy and saves it in an array that is outside of the funcion
        // Therefore we need to add @escaping to it can escape to another context
        callbacks.append(callback)
    }
    
    func aumentaX(time: UInt32, times: Int) {
        lanzarTemporizador(time: 5) {
            //We are capturing X but as the callback does not escape therefore no need to weakfy
            x *= times
        }
    }
    @MainActor
    func aumentaXLuego(time: UInt32, times: Int) {
        lanzarTemporizadorLuego(time: 5) {
            // We are capturing self explicitly and need it when the closure is escaping
            // There is no way to know if Test is going to be alive when the block is called. So we need to explicitly capture self (A strong reference).
            self.x *= times
            print(self.x)
        }
        // We could also use unowned self as this does not increase the reference count but if it is called in a context that the class is deallocated it WILL crash.
    }
    
    @MainActor
    func lanzarTemporizadorLuegoFuera(time: UInt32, callback: @escaping () -> Void) {
        sleep(time)
        callbacksFuera.append(callback)
    }
    
    //En este caso se necesita un weak self porque estamos haciendo un proceso asyncrono que escapa a un ambito diferente al de la funcion
    // El ciclo de vida esta ligado a mientras self este activo
    @MainActor
    func aumentarXLuegoFuera(time: UInt32, times: Int) {
        lanzarTemporizadorLuegoFuera(time: 5) { [weak self] in
            guard let self else { print("No hay nada"); return }
            x *= times
            print(x)
        }
    }
}

do {
    let test = Test()
    test.x
    test.aumentarXLuegoFuera(time: 5, times: 3)
}

sleep(5)
callbacksFuera.first?()
