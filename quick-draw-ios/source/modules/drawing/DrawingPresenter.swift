//
//  TodoPresenter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

class DrawingPresenter: DrawingPresenterProtocol {
    
    // MARK: - Variables
    weak var view: DrawingViewProtocol?
    private let interactor: DrawingInteractorProtocol
    private let router: DrawingRouterProtocol
    private let category: String
    
    init(view: DrawingViewProtocol,
         interactor: DrawingInteractorProtocol,
         router: DrawingRouterProtocol,
         category: String) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.category = category
    }

    func classifyDrawing() {
        interactor.classifyDrawing()
    }
    
    func setCanvas() -> CanvasView? {
        return view?.setCanvas()
    }

    func getCategory() -> String {
        return category
    }
    
    func getPrediction() -> String {
        return interactor.getPrediction()
    }
    
    func showSuccessPopup() {
        guard let view = view else { return }
        router.showSuccessPopup(on: view)
    }
    
    func pushToHome() {
        guard let view = view else { return }
        router.pushToHome(on: view)
    }
    
}
