//
//  OptionsView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 23/02/26.
//

import SwiftUI

struct OptionsView: View {
    
    @ObservedObject var audioService = AudioService.shared
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
                    }
                    .padding()
                    
                    Spacer()
                }
                Text("Options")
                    .font(.custom("WinkySans-Regular_Bold", size: 48))
                    .foregroundStyle(Color(.brownborder))
                
                 Spacer()
                    .frame(height: 60)
                
                Text("Background volume")
                    .font(.custom("WinkySans-Regular", size: 24))
                
                Slider(value: $audioService.bgmVolume, in: 0.0...1.0)
                    .padding(.horizontal, 50)
                
                Text("Sound effects volume")
                    .font(.custom("WinkySans-Regular", size: 24))
                
                Slider(value: $audioService.sfxVolume, in: 0.0...1.0)
                    .padding(.horizontal, 50)
                
                Spacer()
            }
            .frame(width: 450, height: 500)
            .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color(.amarelo))
                .stroke(Color(.brownborder), lineWidth: 5))        }
    }
}
#Preview (traits: .landscapeLeft) {
    OptionsView()
}
