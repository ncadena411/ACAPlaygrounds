import Foundation

func masMenos(_ masMenos: Bool) -> (Int, Int) -> Int {
    masMenos ? {$0 + $1} : {$0 - $1}
}

let partialInc = masMenos(true)
let partialDec = masMenos(false)

partialInc(3,5)
partialDec(3,5)

masMenos(true)(3,5)
// Para el compilador esta funcion seria
(+)(3,5)
