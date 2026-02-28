//
//  DrowningView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 24/02/26.
//
import SwiftUI

struct DrowningView: View {
    
    @ObservedObject var drowningViewModel: DrowningViewModel
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    @ObservedObject var audioService = AudioService.shared
    @State var posXduda: CGFloat = 500
    @State var posYduda: CGFloat = 300
    @State var posXmira: CGFloat = 300
    @State var posYmira: CGFloat = 700
    
    @State var collision: Bool = false
    @State var coast: Bool = false
    @State var isScaled = false
    @State var showSkip = false
    @State var showInstructions = true

    
    var body: some View {
        ZStack {
            Image("gamebg2")
                .resizable()
            
            if drowningViewModel.circle {
                Circle()
                    .stroke(Color.white, lineWidth: 4)
                    .frame(width: 100)
                    .position(x: 100, y: 100)
                    .scaleEffect(isScaled ? 1.01 : 1.0)
                    .onAppear {
                        withAnimation (
                            .easeInOut(duration: 0.3)
                            .repeatForever(autoreverses: true)
                        ) {
                            isScaled.toggle()
                        }
                    }
            }
            
            
            if drowningViewModel.duda{
                Image ("gameassets 4")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .position(x: self.posXduda, y: self.posYduda)
            }
            
            
            Image(drowningViewModel.mira)
                .resizable()
                .scaledToFit()
                .frame(width: 150)
                .scaleEffect(drowningViewModel.duda ? 1.0 : 1.8)
                .position(x: self.posXmira, y: self.posYmira)
                .gesture(
                    DragGesture()
                        .onChanged({value in
                            self.checkCollision()
                            self.checkCoast()
                            if value.location.x >= 800 {
                                self.posXmira =  self.posXmira - (value.location.x * 0.001)
                            } else {
                                self.posXmira = value.location.x
                            }
                            self.posYmira = value.location.y
                            
                            
                        }))
                .onChange(of: self.coast) { oldValue, newValue in
                    if self.coast {
                        withAnimation {
                            self.posXmira = self.posXmira - (self.posXmira * 0.4)
                        }
                        
                        
                    }
                }
            
            VStack {
                Spacer()
                HStack (alignment: .bottom){
                    Spacer()
                    if showSkip {
                        Button {
                            mainMenuViewModel.gameState = .playing
                        } label: {
                            Text("Skip")
                                .font(.custom("WinkySans-Regular", size: 30))
                                .bold()
                                .padding()
                                .foregroundStyle(Color(.brownborder))
                                .background(Color(.amarelo))
                                .cornerRadius(10)
                            
                        }
                    }
                }
                
            }
            .padding(50)
            
            if showInstructions {
                DrowningInstructionsView(onClose: {
                    showInstructions = false
                })
            }
        }
        .ignoresSafeArea()
        .onAppear {
            Task {
                try? await Task.sleep(for: .seconds(20))
            showSkip = true
            }
        }
    }
    func checkCollision() {
        if abs(self.posXduda - self.posXmira) < 100 && abs(self.posYduda - self.posYmira) < 100 {
            
            audioService.playSfx(named: "complete")
            self.collision = true
            self.drowningViewModel.mira = .gameassets1
            self.drowningViewModel.duda = false
            self.drowningViewModel.circle = true
            
            print("eita bateu")
            
            
        } else if (abs(100 - self.posXmira) < 100 && abs(100 - self.posYmira) < 100) && !self.drowningViewModel.duda {
            audioService.playSfx(named: "complete")
            Task {
                try? await Task.sleep(for: .seconds(2))
                mainMenuViewModel.gameState = .playing
            }
        } else {
            self.collision = false
        }
    }
    
    func checkCoast() {
        if posXmira >= 600 {
            self.coast = true
            print("coast")
        } else if self.posXmira <= 500 {
            self.coast = false
        }
    }

}

#Preview (traits: .landscapeLeft) {
    DrowningView(drowningViewModel: DrowningViewModel(), mainMenuViewModel: MainMenuViewModel())
}
