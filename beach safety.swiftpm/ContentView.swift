import SwiftUI

struct ContentView: View {
    
    @StateObject private var menuViewModel = MainMenuViewModel()
    
    var body: some View {
        
        Group {
            switch menuViewModel.gameState {
            case .mainMenu:
                MainMenuView(mainMenuViewModel: menuViewModel)
                
            case .playing:
                GameView()
                
            case .alagamar:
                AlagamarView()
                
            }
        }
    }
}

#Preview(traits: .landscapeLeft) {
    ContentView()
}

