import SwiftUI

struct DashboardView: View {
    
    @State private var user = User()
    
    var missions: [Mission] = [
        Mission(title: "Breathe", description: "Take 60 seconds to breathe slowly", xpReward: 10),
        Mission(title: "Reflect", description: "Write 1 thought", xpReward: 10),
        Mission(title: "Discipline", description: "Delay one impulse", xpReward: 10)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Text("Level \(user.level)")
                    .font(.largeTitle)
                
                ProgressView(value: Double(user.xp), total: 100)
                    .padding(.horizontal)
                
                Text("Streak: \(user.streak) days")
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Stats")
                        .font(.headline)
                    
                    Text("Stress: \(user.stress)")
                    Text("Focus: \(user.focus)")
                    Text("Discipline: \(user.discipline)")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                
                List(missions) { mission in
                    NavigationLink(destination: MissionView(user: $user, mission: mission)) {
                        VStack(alignment: .leading) {
                            Text(mission.title)
                                .bold()
                            Text(mission.description)
                                .font(.caption)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("MindForge")
        }
    }
}
