//
//  DrowningView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 24/02/26.
//
import SwiftUI

struct DrowningView: View {
    
    @State var posXrock: CGFloat = 150
    @State var posYrock: CGFloat = 200
    @State var posXchar: CGFloat = 500
    @State var posYchar: CGFloat = 300
    
    @State var collision: Bool = false
    
    var body: some View {
        ZStack {
            Image("gamebg1")
                .resizable()
            
            Rectangle()
                .frame(width: 200, height: 200)
                .position(x: self.posXrock, y: self.posYrock)
        
            
            Image("gameassets 2")
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .position(x: self.posXchar, y: self.posYchar)
            .gesture(
                DragGesture()
                    .onChanged({value in
                        self.posXchar = value.location.x
                        self.posYchar = value.location.y
                        self.checkCollision()
                    }))
            
        }
        .ignoresSafeArea()
            
    }
    func checkCollision() {
        if abs(self.posXrock - self.posXchar) < 100 && abs(self.posYrock - self.posYchar) < 100 {
            
            self.collision = true
            print("eita bateu")
            
        } else {
            self.collision = false
        }
    }
}

#Preview (traits: .landscapeLeft) {
    DrowningView()
}
