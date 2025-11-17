import Foundation

//Static solution
func masMenos(n: Int, inc: Int, masMenos: Bool) -> Int {
    masMenos ? n + inc : n - inc
}

masMenos(n: 5, inc: 3, masMenos: true)
masMenos(n: 5, inc: 3, masMenos: false)

// Funcion anidada una dentro de la otra
func masMenos2(n: Int, inc: Int, masMenos: Bool) -> Int {
    func incrementar(n: Int, incremento: Int) -> Int {
        n + inc
    }
    
    func decrementar(n: Int, incremento: Int) -> Int {
        n - inc
    }
    
    return masMenos ? incrementar(n: n, incremento: inc) : decrementar(n: n, incremento: inc)
}

masMenos2(n: 5, inc: 3, masMenos: true)

func masMenos3(n: Int, inc: Int, masMenos: Bool) -> Int {
    
    let incrementar = { (num: Int, incremento: Int) -> Int in n + inc}
    let decrementar = { (num: Int, incremento: Int) -> Int in n - inc}
    return masMenos ? incrementar(n, inc) : decrementar(n, inc)
}

func masMenos4(n: Int, inc: Int, masMenos: Bool) -> Int {
    
    let incrementar: (Int, Int) -> Int = { (num, incremento) in n + inc}
    let decrementar: (Int, Int) -> Int = { (num, incremento) in n + inc}
    return masMenos ? incrementar(n, inc) : decrementar(n, inc)
}
//El mas lejible
func masMenos5(n: Int, inc: Int, masMenos: Bool) -> Int {
    
    let incrementar: (Int, Int) -> Int = { $0 + $1 }
    let decrementar: (Int, Int) -> Int = { $0 - $1 }
    return masMenos ? incrementar(n, inc) : decrementar(n, inc)
}

func masMenos6(n: Int, inc: Int, masMenos: Bool) -> Int {
    masMenos ? { (num, incremento) in n + inc}(n, inc) : { (num, incremento) in n - inc}(n, inc)
}

func masMenos7(n: Int, inc: Int, masMenos: Bool) -> Int {
    masMenos ? { $0 + $1 }(n, inc) : { $0 - $1 }(n, inc)
}

//WTF is this! jejeje its called Parcialization
func masMenos8(n: Int, inc: Int, masMenos: Bool) -> Int {
   (masMenos ? (+) : (-))(n, inc)
}
