import SwiftUI

struct ContentView: View {
    
    @StateObject private var menuViewModel = MainMenuViewModel()
    @StateObject private var drowningViewModel = DrowningViewModel()

    
    var body: some View {
        
        Group {
            switch menuViewModel.gameState {
            case .rotation:
                RotationView()
            case .mainMenu:
                MainMenuView(mainMenuViewModel: menuViewModel)
                
            case .playing:
                GameView(mainMenuViewModel: menuViewModel)
                
            case .alagamar:
                DrowningView(drowningViewModel: drowningViewModel, mainMenuViewModel: menuViewModel)
                
            case .eyeglass:
                EyeglassView(mainMenuViewModel: menuViewModel)
            }
                
        }
        .onAppear{
            menuViewModel.goToMainMenu()
            
        }
    }
}

#Preview(traits: .landscapeLeft) {
    ContentView()
}

