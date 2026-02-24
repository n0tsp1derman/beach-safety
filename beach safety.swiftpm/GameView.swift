//
//  GameView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import SwiftUI

struct GameView: View {
    
    @State var dialogService = DialogService.shared

    
    var body: some View {
        
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
}

#Preview(traits: .landscapeLeft) {
    GameView()
}
