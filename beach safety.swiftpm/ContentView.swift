import SwiftUI

struct ContentView: View {
    
    var giroscopio = MotionService()
    init(giroscopio: MotionService = MotionService()) {
        self.giroscopio = giroscopio
        self.giroscopio.startListening()
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
//                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("\(giroscopio.rotation.x)")
        }
    }
}
