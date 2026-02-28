//
//  AudioService.swift
//  beach safety
//
//  Created by Yasmin Salamon on 23/02/26.
//

@preconcurrency
import AVFoundation
import Foundation

@MainActor
class AudioService: NSObject, ObservableObject {
    static let shared = AudioService()
    
    @Published var bgmVolume: Float {
        didSet {
            bgmPlayer?.volume = bgmVolume
            UserDefaults.standard.set(bgmVolume, forKey: "bgmVolume")
        }
    }
    
    @Published var sfxVolume: Float {
        didSet {
            sfxPlayer?.volume = sfxVolume
            UserDefaults.standard.set(sfxVolume, forKey: "sfxVolume")
        }
    }
    
    private var bgmPlayer: AVAudioPlayer?
    private var sfxPlayer: AVAudioPlayer?

    
    override init() {
        self.bgmVolume = UserDefaults.standard.object(forKey: "bgmVolume") as? Float ?? 0.5
        self.sfxVolume = UserDefaults.standard.object(forKey: "sfxVolume") as? Float ?? 0.5
        
        super.init()
    }
    
    func playBgm (named name: String, withExtension ext: String = "mp3") {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("Sound file not found")
            return
        }
        do {
            bgmPlayer = try AVAudioPlayer(contentsOf: url)
            bgmPlayer?.numberOfLoops = -1
            bgmPlayer?.volume = self.sfxVolume
            bgmPlayer?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }
    
    func playSfx (named name: String, withExtension ext: String = "mp3") {
        guard let url = Bundle.main.url(forResource: name, withExtension: ext) else {
            print("Sound file not found")
            return
        }
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: url)
            sfxPlayer?.numberOfLoops = 0
            sfxPlayer?.volume = self.sfxVolume
            sfxPlayer?.play()
        } catch {
            print("Failed to play sound: \(error)")
        }
    }
}

