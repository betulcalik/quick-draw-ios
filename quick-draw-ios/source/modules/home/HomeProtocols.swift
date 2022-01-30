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
    func navigateToTodo()
}

// MARK: - Presenter
protocol HomePresenterProtocol: AnyObject {
    func navigateToTodo()
}

// MARK: - Router
protocol HomeRouterProtocol: AnyObject {
    static func build() -> HomeViewController
    func navigateToTodo(on view: HomeViewProtocol)
}
