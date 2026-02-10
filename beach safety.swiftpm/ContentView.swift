import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        HStack {
            Spacer()
            VStack{
                Button {
                    
                } label: {
                    Text("Play")
                        .font(.title)
                        .foregroundStyle(.white)
                        .background(.green)
                        .padding()
                }

            }
        }
    }
}

