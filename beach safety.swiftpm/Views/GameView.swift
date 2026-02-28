//
//  GameView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    @ObservedObject var audioService = AudioService.shared
    @State var dialogService = DialogService.shared
    @State private var showOptions = false
    
    
    var body: some View {
        
        ZStack {
            
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
                .onAppear {
                    dialogService.fetch()
                }
                
                HStack {
                    VStack (alignment: .leading, spacing: 0){
                        Spacer()
                        Text(dialogService.selectedCharacter)
                            .font(.custom("WinkySans-Regular_Bold", size: 48))
                            .foregroundStyle(Color(.boxbg))
                            .padding()
                            .frame(maxWidth: 336, minHeight: 62, maxHeight: 62)
                            .background(
                                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii
                                    .init(topLeading: 30, topTrailing: 30)
                                )
                                .fill(Color(.brownborder))
                                .stroke(Color(.brownborder), lineWidth: 5))
                        
                        Text(dialogService.selectedSpeech)
                            .font(.custom("WinkySans-Regular", size: 36))
                            .foregroundStyle(Color(.brownborder))
                            .padding()
                            .frame(maxWidth: 952, maxHeight: 156)
                            .background(
                                UnevenRoundedRectangle(cornerRadii:
                                        .init(bottomLeading: 30, bottomTrailing: 30, topTrailing: 30))
                                .fill(Color(.boxbg))
                                .stroke(Color(.brownborder), lineWidth: 5))
                    }
                    .padding()
                    
                    
                    VStack{
                        Spacer()
                        Button {
                            let currentDialog = dialogService.currentDialog()
                            
                            if ((currentDialog + 1) == 6) {
                                mainMenuViewModel.gameState = .eyeglass
                            } else if ((currentDialog + 1) == 30) {
                                mainMenuViewModel.gameState = .alagamar
                            } else if ((currentDialog + 1) == 50){
                                mainMenuViewModel.gameState = .ending
                            } else {
                                
                            }
                                audioService.playSfx(named: "button")
                                dialogService.nextAction()
                            
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color(.brownborder))
                                    .frame(width: 150, height: 150)
                                
                                Image(systemName: "arrow.right")
                                    .foregroundStyle(Color(.boxbg))
                                    .font(.system(size: 80))
                                    .bold()
                                
                            }
                        }
                    }
                    .padding()
                    
                }
            }
            if showOptions {
                OptionsView(onClose: {
                    showOptions = false
                })
            }
        }
        .ignoresSafeArea()
        .background {
            Image(dialogService.selectedImageName)
                .resizable()
                .scaledToFill()
                .overlay {
                    AnimationLayer()
                }
        }
        
        
    }
   
}

#Preview(traits: .landscapeLeft) {
    GameView(mainMenuViewModel: MainMenuViewModel())
}
