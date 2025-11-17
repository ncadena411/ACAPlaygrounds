import Foundation

//Es lo mismo que una clase pero por valor
//La instancia de un struct depende exclusivamente de copia
//La mutabilidad del struct depende de su declaracion por ejemplo si se declara en un var o let
//La constante o variable que almacena la instancia del struct, NO guarda la direccion de memoria guarda EL DATO en si.
// Los structs NO tienen herencia
// Los struct NO tienen init sintetizados: tienen memberwise initializer
// Una constante no inicializada se incluye en el inicializador, una inicializada NO se incluye. un var siempre da la opcion se crea un init nuevo.
// Los structs NO soportan init de conveniencia todos son designados (Se deben inicializar todas las contantes/variables no inicializadas)
// Solo se debe usar init en un struct si queremos que las constantes que se inyectan en el struct puedan ser tratadas de manera previa a la inicializacion
// Los structs, por defecto son SENDABLE

struct Empleado {
    let name: String
    let department: String = "Desarollo"
    var salary: Double = 50000
    
    //Stateless function
    func calculateTaxes(percentage: Double) -> Double {
        salary * percentage / 100
    }
    
    //We should use mutating when we are going to MODIFY a Variable in our struct
    mutating func augmentSalary(percentage: Double) {
        salary += (salary * percentage / 100)
    }
}

var empleado1 = Empleado(name: "Esteban Trabajos")
empleado1.salary = 60000
empleado1.calculateTaxes(percentage: 20)

var empleado2 = Empleado(name: "Guillermo Cancelas")
empleado2.salary
empleado2.augmentSalary(percentage: 20)
empleado2.salary
