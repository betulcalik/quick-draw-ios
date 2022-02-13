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
    var category: String?
    
    init(view: DrawingViewProtocol,
         interactor: DrawingInteractorProtocol,
         router: DrawingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func getCategory() -> String {
        return self.category ?? ""
    }
    
    func getClassifyResult(with canvas: CanvasView) -> String {
        let result = interactor.classifyDrawing(with: canvas)
        return result
    }
    
    func showSuccessPopup() {
        guard let view = view else { return }
        router.showSuccessPopup(on: view)
    }
    
    func showErrorPopup() {
        guard let view = view else { return }
        router.showErrorPopup(on: view)
    }
    
    func pushToHome() {
        guard let view = view else { return }
        router.pushToHome(on: view)
    }
    
}
