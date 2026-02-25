//
//  MainMenuViewModel.swift
//  beach safety
//
//  Created by Yasmin Salamon on 12/02/26.
//

import Foundation

@MainActor
class MainMenuViewModel: ObservableObject {
    @Published var gameState: GameState = .mainMenu
    
    func startGame() {
        gameState = .playing
    }
    
    func alagamar() {
        gameState = .alagamar
    }
}
