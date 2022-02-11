//
//  SpeechManager.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 11.02.2022.
//

import AVFoundation

class SpeechManager {
    
    // MARK: - Variables
    static let shared = SpeechManager()
    private let synthesizer = AVSpeechSynthesizer()
    private var didVoiceBegan = false
    
    func speech(text: String) {
        if !didVoiceBegan {
            startSpeech(text: text)
        } else {
            stopSpeech()
        }
        didVoiceBegan = !didVoiceBegan
    }
    
    private func startSpeech(text: String) {
        let speechUtterance = AVSpeechUtterance(string: text)
        speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        speechUtterance.rate = 0.4
        synthesizer.speak(speechUtterance)
    }
    
    private func stopSpeech() {
        synthesizer.stopSpeaking(at: .immediate)
    }
}
