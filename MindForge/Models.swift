import Foundation

struct User {
    var level: Int = 1
    var xp: Int = 0
    var streak: Int = 1
    
    var stress: Int = 50
    var focus: Int = 50
    var discipline: Int = 50
}

struct Mission: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let xpReward: Int
}
