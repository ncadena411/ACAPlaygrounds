import Foundation

//Patron de dobles en ocasiones, hemos de probar una funcionalidad, pero si lo hacemos podriamos afectar a los datos de produccion
// Este patron permite trabajar con datos de prueba en entronos de preview como SwiftUI o trabajando con tests unitarios usando Swift Testing o XCTests
// Este patron de dobles utiliza protocolos para inyectar instancias de distinto tipo que se confirman a un protocolo y permiten usar distintos "Proveedores" de datos o funcionalidad
// En esencia, usamos un protocolo que nos permita igualar el tipo de dato de dos instancias distintas que tienen los mismos metodos, por lo que podemos usar uno que cargue datos de prueba y otro que cargue datos reales de produccion

protocol QueryProtocol {
    func fetchEmpleados() -> [Empleados]
}

final class Empleados {
    var empleados: [Empleados]
    let query: QueryProtocol
    
    init(query: QueryProtocol = EmpleadosData()) {
        self.query = query
        self.empleados = query.fetchEmpleados()
    }
}
// The production logic
struct EmpleadosData: QueryProtocol {
    var empleados = [Empleados]()
    
    func fetchEmpleados() -> [Empleados] {
        cargaDatos()
    }
    
    func cargaDatos() -> [Empleados] {
        //Carga los datos
        return []
    }
}
//Production usage:
let empleados = Empleados()


// The testing logic
struct TestEmpleados: QueryProtocol {
    var test: [Empleados] = []
    
    func fetchEmpleados() -> [Empleados] {
        test
    }
}
// Testing usage
let empTest = Empleados(query: TestEmpleados())

// MARK: - Movie Model
struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let director: String
    let year: Int
    let duration: Int // en minutos
    let genre: String
    let rating: Double // de 0 a 10
    let synopsis: String
}

protocol DataRepository {
    func load() -> [Movie]
}

struct Repository: DataRepository {
    // MARK: - Dataset Completo (30 películas)
    let movies: [Movie] = [
        Movie(title: "El Padrino", director: "Francis Ford Coppola", year: 1972, duration: 175, genre: "Drama", rating: 9.2, synopsis: "La historia de la familia Corleone y su imperio criminal en Nueva York."),
        Movie(title: "Pulp Fiction", director: "Quentin Tarantino", year: 1994, duration: 154, genre: "Crimen", rating: 8.9, synopsis: "Historias entrelazadas de criminales en Los Ángeles."),
        Movie(title: "El Caballero Oscuro", director: "Christopher Nolan", year: 2008, duration: 152, genre: "Acción", rating: 9.0, synopsis: "Batman enfrenta al Joker en Gotham City."),
        Movie(title: "Forrest Gump", director: "Robert Zemeckis", year: 1994, duration: 142, genre: "Drama", rating: 8.8, synopsis: "La vida extraordinaria de un hombre con buen corazón."),
        Movie(title: "Inception", director: "Christopher Nolan", year: 2010, duration: 148, genre: "Ciencia Ficción", rating: 8.8, synopsis: "Ladrones que roban secretos a través de los sueños."),
        Movie(title: "Matrix", director: "Lana y Lilly Wachowski", year: 1999, duration: 136, genre: "Ciencia Ficción", rating: 8.7, synopsis: "Un programador descubre la verdad sobre la realidad."),
        Movie(title: "Gladiador", director: "Ridley Scott", year: 2000, duration: 155, genre: "Acción", rating: 8.5, synopsis: "Un general romano se convierte en gladiador."),
        Movie(title: "Titanic", director: "James Cameron", year: 1997, duration: 195, genre: "Romance", rating: 7.9, synopsis: "Historia de amor a bordo del famoso barco."),
        Movie(title: "El Señor de los Anillos: El Retorno del Rey", director: "Peter Jackson", year: 2003, duration: 201, genre: "Fantasía", rating: 9.0, synopsis: "La batalla final por la Tierra Media."),
        Movie(title: "Star Wars: Una Nueva Esperanza", director: "George Lucas", year: 1977, duration: 121, genre: "Ciencia Ficción", rating: 8.6, synopsis: "Luke Skywalker se une a la rebelión contra el Imperio."),
        Movie(title: "Jurassic Park", director: "Steven Spielberg", year: 1993, duration: 127, genre: "Aventura", rating: 8.2, synopsis: "Un parque temático con dinosaurios clonados sale mal."),
        Movie(title: "El Silencio de los Inocentes", director: "Jonathan Demme", year: 1991, duration: 118, genre: "Thriller", rating: 8.6, synopsis: "Una agente del FBI busca ayuda de un asesino encarcelado."),
        Movie(title: "Interstellar", director: "Christopher Nolan", year: 2014, duration: 169, genre: "Ciencia Ficción", rating: 8.7, synopsis: "Astronautas buscan un nuevo hogar para la humanidad."),
        Movie(title: "Los Vengadores", director: "Joss Whedon", year: 2012, duration: 143, genre: "Acción", rating: 8.0, synopsis: "Superhéroes se unen para salvar la Tierra."),
        Movie(title: "Toy Story", director: "John Lasseter", year: 1995, duration: 81, genre: "Animación", rating: 8.3, synopsis: "Los juguetes cobran vida cuando los humanos no miran."),
        Movie(title: "El Rey León", director: "Roger Allers y Rob Minkoff", year: 1994, duration: 88, genre: "Animación", rating: 8.5, synopsis: "Un joven león debe reclamar su lugar como rey."),
        Movie(title: "Coco", director: "Lee Unkrich", year: 2017, duration: 105, genre: "Animación", rating: 8.4, synopsis: "Un niño viaja a la Tierra de los Muertos."),
        Movie(title: "Parásitos", director: "Bong Joon-ho", year: 2019, duration: 132, genre: "Drama", rating: 8.5, synopsis: "Una familia pobre se infiltra en la vida de los ricos."),
        Movie(title: "Mad Max: Fury Road", director: "George Miller", year: 2015, duration: 120, genre: "Acción", rating: 8.1, synopsis: "Una persecución épica en un desierto postapocalíptico."),
        Movie(title: "La La Land", director: "Damien Chazelle", year: 2016, duration: 128, genre: "Musical", rating: 8.0, synopsis: "Romance entre un pianista y una actriz en Los Ángeles."),
        Movie(title: "El Gran Hotel Budapest", director: "Wes Anderson", year: 2014, duration: 99, genre: "Comedia", rating: 8.1, synopsis: "Aventuras de un conserje legendario de hotel europeo."),
        Movie(title: "Dunkerque", director: "Christopher Nolan", year: 2017, duration: 106, genre: "Bélica", rating: 7.8, synopsis: "La evacuación de soldados aliados en la Segunda Guerra Mundial."),
        Movie(title: "Blade Runner 2049", director: "Denis Villeneuve", year: 2017, duration: 164, genre: "Ciencia Ficción", rating: 8.0, synopsis: "Un blade runner descubre un secreto que podría cambiar todo."),
        Movie(title: "Whiplash", director: "Damien Chazelle", year: 2014, duration: 106, genre: "Drama", rating: 8.5, synopsis: "Un joven baterista y su despiadado instructor."),
        Movie(title: "El Origen", director: "Christopher Nolan", year: 2010, duration: 148, genre: "Thriller", rating: 8.8, synopsis: "Ladrones especializados en extraer secretos de los sueños."),
        Movie(title: "Ciudadano Kane", director: "Orson Welles", year: 1941, duration: 119, genre: "Drama", rating: 8.3, synopsis: "La vida de un magnate de los medios."),
        Movie(title: "Casablanca", director: "Michael Curtiz", year: 1942, duration: 102, genre: "Romance", rating: 8.5, synopsis: "Romance en Marruecos durante la Segunda Guerra Mundial."),
        Movie(title: "Vértigo", director: "Alfred Hitchcock", year: 1958, duration: 128, genre: "Thriller", rating: 8.3, synopsis: "Un detective con miedo a las alturas se obsesiona con una mujer."),
        Movie(title: "Psicosis", director: "Alfred Hitchcock", year: 1960, duration: 109, genre: "Horror", rating: 8.5, synopsis: "Una mujer roba dinero y se encuentra con un perturbado motelero."),
        Movie(title: "El Resplandor", director: "Stanley Kubrick", year: 1980, duration: 146, genre: "Horror", rating: 8.4, synopsis: "Un escritor se vuelve loco mientras cuida un hotel aislado.")
    ]
    
    func load() -> [Movie] {
        movies
    }
}

struct RepositoryTest: DataRepository {
    // MARK: - Dataset de Prueba (3 películas)
    let moviesTest: [Movie] = [
        Movie(title: "El Padrino", director: "Francis Ford Coppola", year: 1972, duration: 175, genre: "Drama", rating: 9.2, synopsis: "La historia de la familia Corleone y su imperio criminal en Nueva York."),
        Movie(title: "Inception", director: "Christopher Nolan", year: 2010, duration: 148, genre: "Ciencia Ficción", rating: 8.8, synopsis: "Ladrones que roban secretos a través de los sueños."),
        Movie(title: "Toy Story", director: "John Lasseter", year: 1995, duration: 81, genre: "Animación", rating: 8.3, synopsis: "Los juguetes cobran vida cuando los humanos no miran.")
    ]
    
    func load() -> [Movie] {
        moviesTest
    }
}

final class Presentation {
    var movies: [Movie]
    let repository: DataRepository
    
    init(repository: DataRepository = Repository()) {
        self.repository = repository
        self.movies = repository.load()
    }
}

let presentation = Presentation()
presentation.movies.count

let presentationTest = Presentation(repository: RepositoryTest())
presentationTest.movies.count

extension Presentation {
    @MainActor static let test = Presentation(repository: RepositoryTest())
}


