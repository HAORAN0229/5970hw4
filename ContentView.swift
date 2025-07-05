import SwiftUI

struct ContentView: View {
    @State var moodValue = 50.0
    @State var selectedDate = Date()
    @State var savedMood = ""
    
    // Get mood description and emoji
    func getMood() -> (String, String) {
        if moodValue <= 20 {
            return ("Very Sad", "😢")
        } else if moodValue <= 40 {
            return ("Sad", "🙁")
        } else if moodValue <= 60 {
            return ("Neutral", "😐")
        } else if moodValue <= 80 {
            return ("Happy", "🙂")
        } else {
            return ("Very Happy", "😄")
        }
    }
    
    var body: some View {
        ZStack {
            // Add gradient background
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("My Mood Today")
                    .font(.system(size: 40, weight: .bold))
                    .padding()
                
                // Show emoji and description
                let mood = getMood()
                Text("\(mood.0) \(mood.1)")
                    .font(.title)
                
                // Slider
                Slider(value: $moodValue, in: 0...100)
                    .padding()
                Text("Mood Level: \(Int(moodValue))")
                
                // Date picker
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)
                    .padding()
                
                // Save button
                Button {
                    let dateStr = selectedDate.formatted(date: .abbreviated, time: .omitted)
                    savedMood = "On \(dateStr), you felt \(getMood().1)"
                } label: {
                    Text("Save Mood")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                if !savedMood.isEmpty {
                    Text(savedMood)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .padding()
        }
    }
}
