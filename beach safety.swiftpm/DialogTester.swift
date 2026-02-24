//
//  SwiftUIView.swift
//  beach safety
//
//  Created by Yasmin Salamon on 11/02/26.
//

import SwiftUI

struct DialogTester: View {
    @State var dialogService = DialogService.shared
    
    var body: some View {
        VStack {
            Text(dialogService.selectedCharacter)
            
            Text(dialogService.selectedSpeech)
            
            Button("Próximo bb") {
                dialogService.nextAction()
            }
        }
        .background {
            Image(dialogService.selectedImageName)
                .resizable()
                .scaledToFill()
        }
    }
}

#Preview (traits: .landscapeLeft){
    DialogTester()
}
