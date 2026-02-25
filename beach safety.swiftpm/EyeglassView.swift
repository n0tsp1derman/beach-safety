//
//  EyeglassView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 25/02/26.
//
import SwiftUI

struct EyeglassView: View {
    @State var posXmermaid: CGFloat = 150
    @State var posYmermaid: CGFloat = 200
    @State var posXeyeglass: CGFloat = 500
    @State var posYeyeglass: CGFloat = 300
    
    @State var collision: Bool = false
    var body: some View {
        ZStack {
            Image("binoculos")
                .resizable()
            
            Rectangle()
                .frame(width: 200, height: 200)
                .position(x: self.posXmermaid, y: self.posYmermaid)
        
            
            Rectangle()
                .frame(width: 200, height: 200)
                .position(x: self.posXeyeglass, y: self.posYeyeglass)
            .gesture(
                DragGesture()
                    .onChanged({value in
                        self.posXeyeglass = value.location.x
                        self.posYeyeglass = value.location.y
                        self.checkCollision()
                    }))
            
        }
    }
    func checkCollision() {
        if abs(self.posXmermaid - self.posXeyeglass) < 100 && abs(self.posYmermaid - self.posYeyeglass) < 100 {
            
            self.collision = true
            print("eita bateu")
            
        } else {
            self.collision = false
        }
    }
}

#Preview {
    EyeglassView()
}
