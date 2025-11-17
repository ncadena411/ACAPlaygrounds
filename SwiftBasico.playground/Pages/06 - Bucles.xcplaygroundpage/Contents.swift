import Foundation

for i in 1...10 {
    print(i)
}

var acumulado = 0
for i in 1...10 {
    acumulado += i
}
print(acumulado)


//Solo se recorre la mitad de los casos en este caso 5
for i in 1...10 where i % 2 == 0 {
    acumulado += i
}
print(acumulado)

//Para recorrer una funcion en diferentes saltos
// con "to" no llega al valor final
for i in stride(from: 0, to: 25, by: 5) {
    print(i)
}
// con through llega al valor final si es que hay
for i in stride(from: 0, through: 25, by: 5) {
    print(i)
}

for _ in 1...3 {
    print("Knock knock, Penny")
}

var valor: Int
let buscado = Int.random(in: 1...20)

repeat {
    valor = Int.random(in: 1...20)
} while valor != buscado

print(buscado, valor)

var valor2 = -1
let busca2 = Int.random(in: 1...20)

while valor2 != busca2 {
    valor2 = Int.random(in: 1...20)
    print(valor2)
}

var sumatorio = 0
for i in 1...100 {
    if i % 6 == 0 {
        continue
    }
    sumatorio += i
}

var sumar = 0
bucle1: for i1 in 1...50 {
    bucle2: for i2 in 1...50 {
        if i1 == i2 {
            break bucle1
        }
        sumar += i2
    }
    sumar += i1
}
