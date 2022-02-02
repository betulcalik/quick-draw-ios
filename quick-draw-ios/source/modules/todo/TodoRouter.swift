//
//  TodoRouter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

class TodoRouter: TodoRouterProtocol {
    
    static func build() -> TodoViewController {
        let view = TodoViewController()
        let router: TodoRouterProtocol = TodoRouter()
        let interactor: TodoInteractorProtocol = TodoInteractor()
        let presenter: TodoPresenterProtocol = TodoPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
}
