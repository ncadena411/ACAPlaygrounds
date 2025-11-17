import Foundation

let movieURL = Bundle.main.url(forResource: "movies_updated",
                               withExtension: "json")!

extension DateFormatter {
    static let jsonDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return formatter
    }()
}

// If the JSON has Snake case (example_of_snake_case) we can transfer it directly into Camel Case by adding a parameter to the decoder from .convertFromSnakeCase
struct Movies: Codable {
    let title: String
    let year: Int
    let cast: [String]
    let genres: [Genre]
    let releaseDate: Date
}

// Para categorizar valores se necesita estar conformando a Codable en los Enum
enum Genre: String, Codable {
    case action = "Action"
    case adventure = "Adventure"
    case animated = "Animated"
    case biography = "Biography"
    case comedy = "Comedy"
    case crime = "Crime"
    case dance = "Dance"
    case disaster = "Disaster"
    case documentary = "Documentary"
    case drama = "Drama"
    case erotic = "Erotic"
    case family = "Family"
    case fantasy = "Fantasy"
    case foundFootage = "Found Footage"
    case historical = "Historical"
    case horror = "Horror"
    case independent = "Independent"
    case legal = "Legal"
    case liveAction = "Live Action"
    case martialArts = "Martial Arts"
    case musical = "Musical"
    case mystery = "Mystery"
    case noir = "Noir"
    case performance = "Performance"
    case political = "Political"
    case romance = "Romance"
    case satire = "Satire"
    case scienceFiction = "Science Fiction"
    case short = "Short"
    case silent = "Silent"
    case slasher = "Slasher"
    case sport = "Sport"
    case sports = "Sports"
    case spy = "Spy"
    case superhero = "Superhero"
    case supernatural = "Supernatural"
    case suspense = "Suspense"
    case teen = "Teen"
    case thriller = "Thriller"
    case war = "War"
    case western = "Western"
}

do {
    let data = try Data(contentsOf: movieURL)
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    decoder.dateDecodingStrategy = .formatted(.jsonDate)
    let movies = try decoder.decode([Movies].self, from: data)
    print(movies.first!)
} catch {
    print(error)
}
