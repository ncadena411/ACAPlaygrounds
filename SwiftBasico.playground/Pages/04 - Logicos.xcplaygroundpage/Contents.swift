
// AMBITO (SCOPE)
// Cuando se declara y se inicializa

let x = 1 //GLOBAL - Puede ser utilizada por todos en el Global

do { x // Como fue creada en GLOBAL puede ser usada
    let y = 2 //Creada e inicializada en el LOCAL NO se puede usar en otro ambito porque fue creado e inicializado aca "VIVE aca"
}

print(x)

// los ambitos son OBLIGATORIOS - Osea {}


if x > 0 {
    print("x es mayor que 0")
}

if x > 0 {
    print("x es mayor que 0")
} else {
    print("x es menor que 0")
}

if x > 0 {
    print("x es mayor que 0")
} else if x == 0 {
    print("x es igual a 0")
} else {
    print("x es menor que 0")
}

// CONDICIONALES LOGICOS

if x > 0 && x < 10 {
    
}

if x > 0 || x < 10 {
    
}

// El IF es un STATEMENT no necesita return
// es muy interesante para SWIFTUI para maquinas de estado
// Maquina de estado -> Una máquina de estado es un modelo que describe un sistema que puede encontrarse en un número finito de estados y que puede pasar de un estado a otro al cumplir una condición o recibir una entrada

let saludo = "hola"

let xx = if saludo == "Hola" {
    "saludo"
} else {
    "no es saludo"
}


// El SWITCH es excluyente cuando llega a un case se sale del operador
// el SWITCH tambien es un STATEMENT puede devolver un valor simple por cada caso

switch x {
case 0: print("x es 0")
case 1: print("x es 1")
case 2,3: print("x es 2 y 3")
default:
    print("Otros valores")
}

let temp = 20

let xxx = switch temp {
case 0,1,2,3,4,5,6,7,8,9: "Frio"
case 10,13,14,15,16: "Templado"
case 17, 18, 19, 20, 21, 22: "Calorcete"
case 23, 24, 25, 26, 27, 28, 29: "Se caldea"
default: "Inmedible"
}

print(xxx)
