//
//  DrowningInstructionsView.swift
//  Alagamar
//
//  Created by Yasmin Salamon on 27/02/26.
//

import SwiftUI

struct DrowningInstructionsView: View {
    
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
Get Mira to Duda's position by **dragging** her around the water with your finger. 

After getting to her, **drag** her to the place indicated by the **white circle** to escape the riptide.

But be careful! You are not strong enough to swim against the current, so don't swim to the rocks or you will be pushed back.  
""")
                            .font(.custom("WinkySans-Regular", size: 24))
                            .padding()

                    Spacer()
                        .frame(height: 50)
                }
                .padding(.horizontal, 30)
                Spacer()
            }
            .frame(width: 450, height: 600)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.amarelo))
                .stroke(Color(.brownborder), lineWidth: 5))
        }
    }
}

#Preview {
    DrowningInstructionsView()
}
