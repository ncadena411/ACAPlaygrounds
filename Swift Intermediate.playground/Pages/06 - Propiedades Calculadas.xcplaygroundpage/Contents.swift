import Foundation

// Una variable computada es aquella que usa las propiedades de la clase o estructura
// Una variable computada/calculada debe calcular valores no deberia crear cosas adentro

struct Zone {
    let area: Double
    let name: String
    
    func enterZone() {
        
    }
}

struct Area {
    var lenght: Double
    var width: Double
    
    //A lazy var is created when they are called not when the struct initializes
    //Solo se computa una vez y su valor se cachea
    // Expensive computations are deferred until actually needed
    
    lazy var zone = Zone(area: surface, name: "Zone")
    
    var surface: Double {
        lenght * width
    }
    
    var surfacem2: String {
        formatter.string(from: surface as NSNumber) ?? ""
    }
    
    var center: (x: Double, y: Double) {
        get {
            (lenght / 2, width / 2)
        }
        set {
            lenght = newValue.x * 2
            width = newValue.y  * 2
        }
    }
    
    //Cuerpo de funcion auto ejecutable - Funcion anonima
    //Se inicializa cuando crea la instancia para eficiencia
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.positiveSuffix = " m2"
        return formatter
    }()
}

var area1 = Area(lenght: 35, width: 45)
area1.surface
area1.center
area1.center = (15,10)
area1.surfacem2
