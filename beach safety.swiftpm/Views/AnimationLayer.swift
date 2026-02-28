//
//  AnimationLayer.swift
//  beach safety
//
//  Created by Yasmin Salamon on 26/02/26.
//

import SwiftUI

struct AnimationLayer: View {
    @State var dialogService = DialogService.shared

    @State var xPos = UIScreen.main.bounds.width/2
    @State var yPos = UIScreen.main.bounds.height/2
    @State var isScaled = false

    var body: some View {
        switch dialogService.selectedSpeechId {
            
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
                    xPos = 0
                    yPos = 0
                }
            
        case 39:
            
            Image("boneco")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring.speed(0.40)) {
                        xPos = 580
                        yPos = 600
                    }
                }
                
            
        case 40:
            
            Image("boneco")
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .position(x: xPos, y: yPos)
                .onAppear {
                    withAnimation(.spring.speed(0.40)) {
                        xPos = 700
                        yPos = 300
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
