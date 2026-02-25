//
//  CreditsView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 25/02/26.
//

import SwiftUI

struct CreditsView: View {
    
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
                Text("Credits")
                    .font(.custom("WinkySans-Regular_Bold", size: 48))
                    .foregroundStyle(Color(.brownborder))
                
                 Spacer()
                    .frame(height: 60)
                
                Text("Background volume")
                    .font(.custom("WinkySans-Regular", size: 24))
                
                Spacer()
            }
            .frame(width: 450, height: 500)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.amarelo))
                .stroke(Color(.brownborder), lineWidth: 5)) 
        }
    }
}

#Preview (traits: .landscapeLeft){
    CreditsView()
}
