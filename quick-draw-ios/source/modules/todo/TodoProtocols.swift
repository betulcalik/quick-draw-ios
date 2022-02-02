//
//  TodoProtocols.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

// MARK: - View
protocol TodoViewProtocol: AnyObject {
    var presenter: TodoPresenterProtocol? { get set }
}

// MARK: - Interactor
protocol TodoInteractorProtocol: AnyObject {
    
}

// MARK: - Presenter
protocol TodoPresenterProtocol: AnyObject {
    
}

// MARK: - Router
protocol TodoRouterProtocol: AnyObject {
    static func build() -> TodoViewController
}
