//
//  EyeglassView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 25/02/26.
//
import SwiftUI

struct EyeglassView: View {
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    @ObservedObject var audioService = AudioService.shared
    @State var posXmermaid: CGFloat = 350
    @State var posYmermaid: CGFloat = 500
    @State var posXeyeglass: CGFloat = 500
    @State var posYeyeglass: CGFloat = 300
    
    @State var collision: Bool = false
    @State var canMove: Bool = true

    
    var body: some View {
        ZStack {
            Image("binoculos")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.clear)
                .position(x: self.posXmermaid, y: self.posYmermaid)
            
            Color.black
                .ignoresSafeArea()
                .reverseMask {
                    Circle()
                        .frame(width: 200, height: 200)
                        .position(x: self.posXeyeglass, y: self.posYeyeglass)
                }
                .gesture(
                    DragGesture()
                        .onChanged({value in
                            if self.canMove {
                                self.posXeyeglass = value.location.x
                                self.posYeyeglass = value.location.y
                                self.checkCollision()
                            }
                        }))
                .reverseMask {
                    Circle()
                        .frame(width: 200, height: 200)
                        .position(x: self.posXeyeglass, y: self.posYeyeglass)
                        .offset(x:150)
                    
                }
                .gesture(
                    DragGesture()
                        .onChanged({value in
                            if self.canMove {
                                self.posXeyeglass = value.location.x
                                self.posYeyeglass = value.location.y
                                self.checkCollision()
                            }
                        }))
        }
    }
    func checkCollision() {
        if abs(self.posXmermaid - self.posXeyeglass) < 100 && abs(self.posYmermaid - self.posYeyeglass) < 100 {
            
            self.collision = true
            audioService.playSfx(named: "complete")
            canMove = false
            self.posXeyeglass = self.posXmermaid / 1.25
            self.posYeyeglass = self.posYmermaid
            Task {
                try? await Task.sleep(for: .seconds(2))
                mainMenuViewModel.gameState = .playing
            }
            
            print("eita achou")
            
            
        } else {
            self.collision = false
        }
    }
}

extension View {
    func reverseMask<Mask: View>(
        alignment: Alignment = .center,
        @ViewBuilder _ mask: () -> Mask
    ) -> some View {
        self.mask(
            ZStack(alignment: alignment) {
                Rectangle()
                mask()
                    .blendMode(.destinationOut)
            }
            .compositingGroup()
        )
    }
}

#Preview (traits: .landscapeLeft){
    EyeglassView(mainMenuViewModel: MainMenuViewModel())
}
