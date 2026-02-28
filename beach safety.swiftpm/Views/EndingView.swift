//
//  EndingView.swift
//  Alagamar
//
//  Created by Yasmin Salamon on 27/02/26.
//

import SwiftUI

struct EndingView: View {
    
    let images = ["fim1", "fim2", "fim3", "fim4"]
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var currentIndex = 0
    @State private var showButton = false
    @State private var showOptions = false
    @ObservedObject var audioService = AudioService.shared
    @ObservedObject var mainMenuViewModel: MainMenuViewModel

    
    var body: some View {
        ZStack {
            Image(images[currentIndex])
                .resizable()
                .scaledToFill()
            
            VStack {
                HStack {
                    Button {
                        showOptions = !showOptions
                        audioService.playSfx(named: "button")
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(Color(.brownborder))
                            .font(.system(size: 40))
                            .padding(40)
                    }
                    Spacer()
                }
                Spacer()
            }
            
            if showButton {
                VStack {
                    Spacer()
                    
                    Button{
                        mainMenuViewModel.gameState = .returnMenu
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.amarelo))
                                .stroke(Color(.brownborder), lineWidth: 5)
                                .frame(width: 300, height: 114)
                                .padding()
                            
                            
                            Text("Play again")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                        .padding(50)
                    }
                    
                    if showOptions {
                        OptionsView(onClose: {
                            showOptions = false
                        })
                    }
                }
                .ignoresSafeArea()
            }
        }
        .onReceive(timer) { _ in
                    if currentIndex < images.count - 1 {
                        currentIndex += 1
                    } else {
                        showButton = true
                    }
                }
    }
}
#Preview (traits: .landscapeLeft){
    EndingView(mainMenuViewModel: MainMenuViewModel())
}
