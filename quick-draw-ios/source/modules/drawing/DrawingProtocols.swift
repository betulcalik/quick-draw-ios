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
    func setCanvas() -> CanvasView
    func getCategory()
}

// MARK: - Interactor
protocol DrawingInteractorProtocol: AnyObject {
    var presenter: DrawingPresenterProtocol? { get set }
    func classifyDrawing() -> String?
}

// MARK: - Presenter
protocol DrawingPresenterProtocol: AnyObject {
    func setCanvas() -> CanvasView?
    func classifyDrawing()
    func getCategory() -> String
    func pushToHome()
}

// MARK: - Router
protocol DrawingRouterProtocol: AnyObject {
    static func build(with category: String) -> DrawingViewController
    func pushToHome(on view: DrawingViewProtocol)
}
