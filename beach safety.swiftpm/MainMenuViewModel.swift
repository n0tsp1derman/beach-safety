//
//  MainMenuViewModel.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import Foundation

@MainActor
class MainMenuViewModel: ObservableObject {
    @Published var gameState: GameState = .rotation
    
    func goToMainMenu() {
        Task {
            try? await Task.sleep(for: .seconds(5))
            gameState = .mainMenu
        }
    }
    
    func startGame() {
        gameState = .playing
    }
    
    func alagamar() {
        gameState = .alagamar
    }
    
    func eyeglass() {
        gameState = .eyeglass
    }
}
