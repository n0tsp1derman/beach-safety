//
//  AlagamarView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 09/02/26.
//

import SwiftUI

struct AlagamarView: View {
    
    var giroscopio = MotionService()
    init(giroscopio: MotionService = MotionService()) {
        self.giroscopio = giroscopio
        self.giroscopio.startListening()
    }
        
        var body: some View {
            ZStack {
                Color.blue
                
                Image("dudanaagua")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .offset(x: giroscopio.rotation.x * 100, y: giroscopio.rotation.y * 100)
                    
                
            }
            .ignoresSafeArea()
            .onChange(of: giroscopio.rotation.x) {
                print(giroscopio.rotation.x)
                print(giroscopio.rotation.y)
            }
        }
    }

#Preview (traits: .landscapeLeft){
    AlagamarView(giroscopio: MotionService())
}
