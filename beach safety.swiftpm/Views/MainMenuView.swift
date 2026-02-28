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
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack (spacing: 0){
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600)
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
            }
            .padding()
            
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
        .background(
            Image("mainscreen1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
    
}

#Preview (traits: .landscapeLeft){
    MainMenuView(mainMenuViewModel: MainMenuViewModel())
}
