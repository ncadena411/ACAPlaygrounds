import Foundation

// OPERADOR de ASIGNACION
// TODO resultado de un operador PUEDE se asignado a una constante o variable

let value = 10

// OPERADORES BINARIOS Variable operador Variable
// OPERADOR ARITMETICO

var a = 1
let b = 2
let c = 1.2
let d = 3.4

a + b
a - b
a * b
b / a
a % b

// No se puede hacer operaciones entre datos por ejemplo c + a

// Double(a) -> Se hace una copia de a copy on
Double(a) + c

// OPERADOR DE ASIGNACION -> Se debe cambiar la constante a var para que se pueda asignar y hacer el operador al tiempo

a += 1
a -= 1
a *= b
a /= b
a %= b

// OPERADOR DE COMPARACION
// BOOL -> true o false

a == b
a != b
a > b
a < b
a >= b
a <= b

// OPERADOR DE NEGACION

var cosa = true
!cosa // false

// OPERADORES UNARIOS operadorVariable

a = -a

// TERNARIO CONDICIONAL -> Condicion ? valor para true : valor para false DEBE SER EL MISMO TIPO DE DATO

a == b ? "Iguales" : "Diferentes"
