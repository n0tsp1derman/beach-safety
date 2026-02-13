//
//  MainMenuView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import SwiftUI

struct MainMenuView: View {
    
    @ObservedObject var mainMenuViewModel: MainMenuViewModel
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                
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
                            .foregroundStyle(.brown)
                        
                    }
                }
            }
        }
        .background(
            Image("bgteste")
        )
    }
}

#Preview (traits: .landscapeLeft){
    MainMenuView(mainMenuViewModel: MainMenuViewModel())
}
