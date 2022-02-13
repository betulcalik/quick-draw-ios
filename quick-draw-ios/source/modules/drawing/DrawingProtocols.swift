//
//  TodoProtocols.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

// MARK: - View
protocol DrawingViewProtocol: AnyObject {
    var presenter: DrawingPresenterProtocol? { get set }
    func getCategory()
}

// MARK: - Interactor
protocol DrawingInteractorProtocol: AnyObject {
    var presenter: DrawingPresenterProtocol? { get set }
    func classifyDrawing(with canvas: CanvasView) -> String
}

// MARK: - Presenter
protocol DrawingPresenterProtocol: AnyObject {
    var category: String? { get set }
    func getClassifyResult(with canvas: CanvasView) -> String
    func showSuccessPopup()
    func showErrorPopup()
    func pushToHome()
}

// MARK: - Router
protocol DrawingRouterProtocol: AnyObject {
    static func build(with category: String) -> DrawingViewController
    func showSuccessPopup(on view: DrawingViewProtocol)
    func showErrorPopup(on view: DrawingViewProtocol)
    func pushToHome(on view: DrawingViewProtocol)
}
