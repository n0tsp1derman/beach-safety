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
                Text("Background volume")
                
                Slider(value: $audioService.bgmVolume, in: 0.0...1.0)
                    .padding()
                
                Text("Sound effects volume")
                
                Slider(value: $audioService.sfxVolume, in: 0.0...1.0)
                    .padding()
                
                Button {
                    if let onClose = onClose {
                        onClose()
                    }
                } label: {
                    Text("close")
                }
            }
            .frame(width: 350, height: 550)
            .background(Color.white)
            .cornerRadius(20)
        }
    }
}
#Preview (traits: .landscapeLeft) {
    OptionsView()
}
