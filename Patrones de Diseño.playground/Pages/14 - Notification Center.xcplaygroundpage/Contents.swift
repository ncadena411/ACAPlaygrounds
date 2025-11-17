import Foundation

extension Notification.Name {
    static let aviso = Notification.Name("aviso")
}

final class Emisora {
    var timer: Timer?
    
    init(seconds: TimeInterval) {
        self.timer = .scheduledTimer(withTimeInterval: seconds,
                                     repeats: false) { _ in
            let dic: [String: Any] = ["name": "Paco", "surname": "Gil", "yearsOld": 30]
            // The post is to post a notification to a specific place
            NotificationCenter.default.post(name: .aviso, object: "Hola soy una persona", userInfo: dic)
        }
    }
}

final class Receptora {
    init () {
        getNotifications()
    }
    
    private func getNotifications() {
        // To register an observer we can use
        NotificationCenter.default.addObserver(forName: .aviso,
                                               object: nil,
                                               queue: .main) { notification in
            guard let object = notification.object as? String,
            let dic = notification.userInfo as? [String: Any],
            let name = dic["name"] as? String,
            let surname = dic["surname"] as? String,
            let yearsOld = dic["yearsOld"] as? Int else { return }
            print("\(object): \(surname), \(name), \(yearsOld) years old.")
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: .aviso, object: nil)
    }
}

let emisor = Emisora(seconds: 10)
let receptor = Receptora()

