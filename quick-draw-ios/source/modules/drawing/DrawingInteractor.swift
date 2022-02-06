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

    func classifyDrawing() -> String? {
        let canvas = presenter?.setCanvas()
        
        guard let image = canvas?.uiImage(),
              let buffer = image.pixelBufferGray(width: 28, height: 28) else {
            return ""
        }
        
        guard let output = try? model.prediction(drawing: buffer) else {
            return ""
        }

        return output.label
    }
}
