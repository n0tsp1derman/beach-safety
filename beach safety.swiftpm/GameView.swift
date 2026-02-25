//
//  GameView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import SwiftUI

struct GameView: View {
    
    @State var dialogService = DialogService.shared
    @State private var showOptions = false

    
    var body: some View {
        
        ZStack {
            VStack {
                
                HStack {
                    Button {
                        showOptions = !showOptions
                    } label: {
                        Image(systemName: "gearshape.fill")
                            .foregroundStyle(Color(.brownborder))
                            .font(.system(size: 40))
                            .padding()
                    }
                    
                    
                    Spacer()
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
                            )
                        
                        Text(dialogService.selectedSpeech)
                            .font(.custom("WinkySans-Regular", size: 36))
                            .foregroundStyle(Color(.brownborder))
                            .padding()
                            .frame(maxWidth: 952, maxHeight: 156)
                            .background(
                                UnevenRoundedRectangle(cornerRadii:
                                        .init(bottomLeading: 40, bottomTrailing: 40, topTrailing: 40))
                                .fill(Color(.boxbg))
                            )
                    }
                    .padding()
                    
                    VStack{
                        Spacer()
                        Button {
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
                .ignoresSafeArea()
                .background {
                    Image(dialogService.selectedImageName)
                        .resizable()
                        .scaledToFill()
                }
            }
            .ignoresSafeArea()
            
            if showOptions {
                OptionsView(onClose: {
                    showOptions = false
                })
            }
        }
    }
}

#Preview(traits: .landscapeLeft) {
    GameView()
}
