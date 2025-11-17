import Foundation

let num = 42
let numD = 58.6
let fecha = Date.now

let formatDate = DateFormatter()
formatDate.dateStyle = .long
formatDate.timeStyle = .medium
formatDate.locale = Locale(identifier: "es_ES")
formatDate.string(from: fecha)

let formatDate2 = DateFormatter()
formatDate2.dateFormat = "dd--MM--yyyy HH:mm"
formatDate.string(from: fecha)
let miFecha = "25-12-1995 14:30"
formatDate2.date(from: miFecha)

fecha.formatted()
fecha.formatted(.iso8601)
fecha.formatted(.dateTime.weekday(.wide).day().month(.wide))
fecha.formatted(date: .numeric, time: .shortened)

numD.formatted()
numD.formatted(.currency(code: "USD"))
numD.formatted(.percent)

let compositores = ["John Williams", "Ludwig van Beethoven", "Wolfgang Amadeus Mozart"]

compositores.formatted()
