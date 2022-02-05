//
//  HomeProtocols.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 30.01.2022.
//

import Foundation

// MARK : - View
protocol HomeViewProtocol: AnyObject {
    var presenter: HomePresenterProtocol? { get set }
    func pushToDrawing()
}

// MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func pushToDrawing()
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    static func build() -> HomeViewController
    func pushToDrawing(on view: HomeViewProtocol)
}
