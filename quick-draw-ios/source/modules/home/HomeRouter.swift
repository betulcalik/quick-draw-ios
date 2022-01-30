//
//  HomeRouter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 30.01.2022.
//

import Foundation

class HomeRouter: HomeRouterProtocol {
    
    static func build() -> HomeViewController {
        let view = HomeViewController()
        let router: HomeRouterProtocol = HomeRouter()
        let presenter: HomePresenterProtocol = HomePresenter(view: view, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
    func navigateToTodo(on view: HomeViewProtocol) {
        
    }

}
