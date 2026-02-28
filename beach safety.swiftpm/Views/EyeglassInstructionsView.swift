//
//  EyeglassInstructionsView.swift
//  Alagamar
//
//  Created by Yasmin Salamon on 27/02/26.
//

import SwiftUI

struct EyeglassInstructionsView: View {
    
    var onClose:(() -> Void)? = nil

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                HStack (alignment: .top){
                    Button {
                        if let onClose = onClose {
                            onClose()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundStyle(Color(.brownborder))
                            .font(.largeTitle)
                            .bold()
                    Spacer()
                    }
                    .padding()
                }
                
                    VStack (spacing: 20){
                        
                        Text("""
Look around with your binoculars by **dragging** your finger across the screen, until you find something shiny!
""")
                            .font(.custom("WinkySans-Regular", size: 24))
                            .padding()

                    Spacer()
                        .frame(height: 50)
                }
                .padding(.horizontal, 30)
                Spacer()
            }
            .frame(width: 450, height: 350)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.amarelo))
                .stroke(Color(.brownborder), lineWidth: 5))
        }
    }
}

#Preview {
    EyeglassInstructionsView()
}
