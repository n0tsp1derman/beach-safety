//
//  DialogManager.swift
//  beach safety
//
//  Created by Yasmin Salamon on 10/02/26.
//

import Foundation
import SwiftUI

struct CharacterSpeech: Codable {
    let id: Int
    let backgroundImages: [String]
    let character: String
    let speech: String
    
//    Só pra inicializar um bgl vazio kk
    init(id: Int = 0, backgroundImages: [String] = [""], character: String = "", speech: String = "") {
        self.id = id
        self.backgroundImages = backgroundImages
        self.character = character
        self.speech = speech
    }
}

@Observable
@MainActor
class DialogService {
    private(set) var selectedSpeechId = 0
    private(set) var selectedImageId = 0
    private(set) var selectedDialog = CharacterSpeech()
    var selectedImageName: String {
        return selectedDialog.backgroundImages[selectedImageId]
    }
    
    var selectedSpeech: String {
        return selectedDialog.speech
    }
    
    var selectedCharacter: String {
        return selectedDialog.character
    }
    
    static let shared = DialogService()
    
    private init(){}
    
    //Gerenciamento interno dele, pode chamar só aqui dentro desse arquivo
    private func getSpeech() -> CharacterSpeech {
        let file = "Dialog"
        
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
                fatalError("Faliled to locate \(file) in bundle")
            }
            
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load file from \(file) from bundle")
        }
        
        let decoder = JSONDecoder()
        
        guard let dialog = try? decoder.decode([CharacterSpeech].self, from: data) else {
            fatalError("Failed to decode \(file) from bundle")
        }
        
        selectedDialog = dialog.first(where: {$0.id == selectedSpeechId})!
        return selectedDialog
    }
    
    func nextAction() {
        if selectedImageId == selectedDialog.backgroundImages.count - 1 {
            self.selectedSpeechId += 1
            selectedDialog = getSpeech()
        } else if selectedSpeechId == 18 {
            
        } else {
            self.selectedImageId += 1
        }
    }
    
    func setCustomDialogId(_ id: Int) {
        self.selectedSpeechId = id
    }
    
//    func previousAction() {
//        //TODO: -CHECK IF THERE ARE MORE IMAGES BEFOOOORE
//        self.speechId -= 1
//    }
}

