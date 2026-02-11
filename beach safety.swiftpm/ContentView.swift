import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        HStack {
            Spacer()
            VStack{
                NavigationLink(destination: AlagamarView(),
                               
                label: {
                    Text("Play")
                        .font(.custom("WinkySans", size: 48))
                    
                })
                .padding()
            }
        }
    }
}

#Preview(traits: .landscapeLeft) {
    ContentView()
}

