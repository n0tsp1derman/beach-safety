//
//  MainMenuView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import SwiftUI

struct MainMenuView: View {
    
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    @ObservedObject var audioService = AudioService.shared
    @State private var showOptions = false
    @State private var showCredits = false
    let background = ["mainscreen1", "mainscreen2", "mainscreen3"]
    @State private var currentIndex = 0
    let timer = Timer.publish(every: 0.3, on: .main, in: .common).autoconnect()

    
    var body: some View {
        ZStack {
            Image(background[currentIndex])
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                VStack (spacing: 0){
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 480)
                    Spacer()
                    Button {
                        mainMenuViewModel.startGame()
                        audioService.playSfx(named: "button")
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.amarelo))
                                .stroke(Color(.brownborder), lineWidth: 5)
                                .frame(width: 300, height: 114)
                                .padding()
                            
                            
                            Text("Play")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                        
                    }
                    
                    Button{
                        showOptions = !showOptions
                        audioService.playSfx(named: "button")
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.amarelo))
                                .stroke(Color(.brownborder), lineWidth: 5)
                                .frame(width: 300, height: 114)
                                .padding()
                            
                            
                            Text("Options")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                        
                    }
                    
                    
                    Button{
                        audioService.playSfx(named: "button")
                        showCredits = !showCredits
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(.amarelo))
                                .stroke(Color(.brownborder), lineWidth: 5)
                                .frame(width: 300, height: 114)
                                .padding()
                            
                            
                            Text("About")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                    }
                }
                .padding(50)
            }
            .padding(20)
            
            if showOptions {
                OptionsView(onClose: {
                    showOptions = false
                })
            }
            
            if showCredits {
                CreditsView(onClose: {
                    showCredits = false
                })
            }
            
        }
        .onAppear {
            audioService.playBgm(named: "waves")
        }
        .task {
                    await startLoop()
                }
        }
    
    func startLoop() async {
        while true {
            try? await Task.sleep(for: .seconds(1))
            
            await MainActor.run {
                currentIndex = (currentIndex + 1) % background.count
            }
        }
    }
}

#Preview (traits: .landscapeLeft){
    MainMenuView(mainMenuViewModel: MainMenuViewModel())
}
