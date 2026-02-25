//
//  AlagamarView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 09/02/26.
//

import SwiftUI

struct AlagamarView: View {
    
    @State var posx: CGFloat = 200
    @State var posy: CGFloat = 300
    @State var collision: Bool = false
    
    var giroscopio = MotionService()
    init(giroscopio: MotionService = MotionService()) {
        self.giroscopio = giroscopio
        self.giroscopio.startListening()
    }
    
    var body: some View {
        ZStack {
            Image("gamebg1")
                .resizable()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .position(x: self.posx, y: self.posy)
            
            Image("gameassets 2")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .offset(x: self.giroscopio.rotation.x * 100, y: self.giroscopio.rotation.y * 100)
            
            
            
        }
        .ignoresSafeArea()
        .onChange(of: giroscopio.rotation.x) {
            print(giroscopio.rotation.x)
            print(giroscopio.rotation.y)
            
            self.checkCollision()
        }
    }
    func checkCollision() {
        if abs(self.posx - self.giroscopio.rotation.x) < 100 && abs(self.posy - self.giroscopio.rotation.y) < 100 {
            
            self.collision = true
            print("eita bateu")
            
        } else {
            self.collision = false
        }
    }
    
}

#Preview (traits: .landscapeLeft){
    AlagamarView(giroscopio: MotionService())
}
