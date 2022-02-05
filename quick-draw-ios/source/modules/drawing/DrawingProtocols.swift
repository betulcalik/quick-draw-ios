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
}

// MARK: - Interactor
protocol DrawingInteractorProtocol: AnyObject {
    
}

// MARK: - Presenter
protocol DrawingPresenterProtocol: AnyObject {
    
}

// MARK: - Router
protocol DrawingRouterProtocol: AnyObject {
    static func build() -> DrawingViewController
}
