//
//  ButtonView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 09/02/26.
//

import SwiftUI

struct ButtonView: View {
    
    struct StartButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(Capsule())
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
                .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        }
    }
    
    struct NextButton: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .padding()
                .background(.black)
                .foregroundStyle(.white)
                .scaleEffect(configuration.isPressed ? 1.2 : 1)
        }
    }
    
    var body: some View {
        Button("Play") {
                    print("Button pressed!")
                }
                .buttonStyle(StartButton())
        
        Button("Next") {
            
        }
        .buttonStyle(NextButton())
    }
}

#Preview {
    ButtonView()
}
