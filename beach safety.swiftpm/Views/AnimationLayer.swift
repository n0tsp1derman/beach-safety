//
//  AnimationLayer.swift
//  beach safety
//
//  Created by Yasmin Salamon on 26/02/26.
//

import SwiftUI

struct AnimationLayer: View {
    @State var dialogService = DialogService.shared
    @ObservedObject var audioService = AudioService.shared

    @State var xPos: CGFloat = 850
    @State var yPos: CGFloat = 500
    @State var isScaled = false

    var body: some View {
        switch dialogService.selectedSpeechId {
        
        case 14:
            Image("duda_pulo")
                .resizable()
                .scaledToFit()
                .scaleEffect(isScaled ? 0.3 : 0.5)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation (
                        .easeInOut(duration: 0.3).speed(0.5)
                    ) {
                        xPos = 680
                        yPos = 200
                        isScaled.toggle()
                    }
                    Task {
                        try? await Task.sleep(for: .seconds(3))
                        audioService.playSfx(named: "splash")
                    }
                }
                .onDisappear {
                    xPos = 0
                    yPos = 0
                }
            
        case 20:
            Image("miragrita_anim")
                .resizable()
                .scaledToFit()
                .scaleEffect(isScaled ? 1.1 : 1.0)
                .onAppear {
                    withAnimation (
                        .easeInOut(duration: 0.3)
                        .repeatForever(autoreverses: true)
                    ) {
                        isScaled.toggle()
                    }
                }
        case 21:
            Image("miragrita_anim")
                .resizable()
                .scaledToFit()
                .scaleEffect(isScaled ? 1.1 : 1.0)
                .onAppear {
                    withAnimation (
                        .easeInOut(duration: 0.3)
                        .repeatForever(autoreverses: true)
                    ) {
                        isScaled.toggle()
                    }
                }
        case 22:
            Image("miragrita_anim")
                .resizable()
                .scaledToFit()
                .scaleEffect(isScaled ? 1.1 : 1.0)
                .onAppear {
                    withAnimation (
                        .easeInOut(duration: 0.3)
                        .repeatForever(autoreverses: true)
                    ) {
                        isScaled.toggle()
                    }
                }
        case 23:
            Image("miragrita_anim")
                .resizable()
                .scaledToFit()
                .scaleEffect(isScaled ? 1.1 : 1.0)
                .onAppear {
                    withAnimation (
                        .easeInOut(duration: 0.3)
                        .repeatForever(autoreverses: true)
                    ) {
                        isScaled.toggle()
                    }
                }
            
        case 37:
            Image("graveto")
                .resizable()
                .scaledToFit()
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring(.bouncy, blendDuration: 1.0).speed(0.40)) {
                        xPos = 1100
                        yPos = 700
                    }
                }
                
        case 38:
            Image("graveto")
                .resizable()
                .scaledToFit()
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring(.bouncy, blendDuration: 1.0).speed(0.40)) {
                        xPos = 800
                        yPos = 880
                    }
                }
                .onDisappear {
                    xPos = 550
                    yPos = 600
                }
            
        case 39:
            
            Image("boneco")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring.speed(0.20)) {
                        xPos = 550
                        yPos = 350
                    }
                }
                .onDisappear {
                    xPos = 550
                    yPos = 350
                }
                
            
        case 40:
            
            Image("boneco")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring.speed(0.60)
                        .repeatForever(autoreverses: true)) {
                        xPos = 550
                        yPos = 380
                    }
                }
                .onDisappear {
                    xPos = 550
                    yPos = 350
                }
            
        case 41:
            
            Image("boneco")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring.speed(0.60)
                        .repeatForever(autoreverses: true)) {
                        xPos = 550
                        yPos = 380
                    }
                }
                .onDisappear {
                    xPos = 850
                    yPos = 350
                }
            
        case 42:
            
            Image("boneco")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring.speed(0.20)) {
                        xPos = 950
                        yPos = 350
                    }
                }
                .onDisappear {
                    xPos = 0
                    yPos = 0
                }
            
        default:
            EmptyView()
        }
    }
}
    

#Preview (traits: .landscapeLeft) {
    AnimationLayer()
}
