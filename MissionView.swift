import SwiftUI

struct MissionView: View {
    
    @Binding var user: User
    var mission: Mission
    
    @State private var completed = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text(mission.title)
                .font(.largeTitle)
            
            Text(mission.description)
            
            if !completed {
                Button("Complete Mission") {
                    completeMission()
                    completed = true
                }
                .padding()
            } else {
                Text("Mission Complete!")
            }
        }
        .padding()
    }
    
    func completeMission() {
        user.xp += mission.xpReward
        
        if user.xp >= 100 {
            user.level += 1
            user.xp -= 100
        }
        
        // Simple stat increase
        user.focus += 1
        user.discipline += 1
        user.stress -= 1
    }
}
