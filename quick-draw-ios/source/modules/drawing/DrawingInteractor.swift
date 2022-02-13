//
//  TodoInteractor.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation
import CoreML

class DrawingInteractor: DrawingInteractorProtocol {
    
    // MARK: - Variables
    var presenter: DrawingPresenterProtocol?
    private let model: DrawingModel = {
        do {
            let config = MLModelConfiguration()
            return try DrawingModel(configuration: config)
        } catch {
            fatalError("Couldn't create Drawing Model")
        }
    }()

    func classifyDrawing(with canvas: CanvasView) -> String {
        let image = canvas.uiImage()
        
        guard let buffer = image.pixelBufferGray(width: 28, height: 28),
              let output = try? model.prediction(drawing: buffer) else {
            return ""
        }

        let outputLabel = output.label
        SpeechManager.shared.speech(text: outputLabel)
        
        return output.label
    }

}
