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
    
    
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack (spacing: 5){
                    Spacer()
                    Button {
                        mainMenuViewModel.startGame()
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 341, height: 114)
                                .foregroundStyle(.yellow)
                                .padding()
                            
                            
                            Text("Play")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                    }
                    
                    Button{
                        showOptions = !showOptions
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 341, height: 114)
                                .foregroundStyle(.yellow)
                                .padding()
                            
                            
                            Text("Options")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                    }
                    
                    Button{
                        
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 341, height: 114)
                                .foregroundStyle(.yellow)
                                .padding()
                            
                            
                            Text("Credits")
                                .font(.custom("WinkySans-Regular_Bold", size: 48))
                                .foregroundStyle(Color(.brownborder))
                            
                        }
                    }
                }
            }
            
            if showOptions {
                OptionsView(onClose: {
                    showOptions = false
                })
            }
            
        }
        .onAppear {
            audioService.playBgm(named: "waves")
        }
        .background(
            Image("mainscreen")
        )
    }
    
}

#Preview (traits: .landscapeLeft){
    MainMenuView(mainMenuViewModel: MainMenuViewModel())
}
