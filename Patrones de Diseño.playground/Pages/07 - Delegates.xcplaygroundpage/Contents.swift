import Foundation

//The delegate pattern is a way for one object to delegate responsibility for a specific piece of behavior to another object. A structured way to achieve loose coupling and inversion of control between two objects.
// Roles:
//   • The “owner” (or delegator) defines a protocol that describes what it needs done.
//   • The “delegate” (another object) adopts that protocol and implements the behavior.
// Flow:
//   • The owner holds a reference to a delegate (usually weak to avoid retain cycles).
//   • When an event happens or a decision is needed, the owner calls the delegate’s methods.
// Benefits:
//   • Decouples the owner from concrete implementations — the owner only knows the protocol.
//   • Promotes reuse and testability.
//   • Allows customization of behavior without subclassing the owner.

@MainActor
protocol RelojDelegate: AnyObject {
    func llegoLaHora()
}

//@Sendable forma de enviar cosas a travez de distintos contextos de aislamiento
@MainActor
final class MiReloj {
    var timer: Timer?
    // We can weakyfy our delegates as well to be able to not increase the reference count and when the class is deallocated also the delegate is destroyed
    weak var delegate: RelojDelegate?
    
    init(seconds: TimeInterval) {
        timer = .scheduledTimer(withTimeInterval: seconds, repeats: false) { _ in
            Task { @MainActor in
                self.delegate?.llegoLaHora()
            }
        }
    }
    
    deinit {
        print("Muere MiReloj")
    }
}

@MainActor
final class MiPantalla: RelojDelegate {
    var reloj: MiReloj?
    
    func lanzarReloj() {
        reloj = MiReloj(seconds: 10)
        reloj?.delegate = self
    }
    
    func llegoLaHora() {
        print("Campana y se acabo")
    }
    
    deinit {
        print("Muere MiPantalla")
    }
}

do {
    let pantalla = MiPantalla()
    pantalla.lanzarReloj()
}


