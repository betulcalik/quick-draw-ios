//
//  TodoRouter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

class DrawingRouter: DrawingRouterProtocol {
    
    static func build() -> DrawingViewController {
        let view = DrawingViewController()
        let router: DrawingRouterProtocol = DrawingRouter()
        let interactor: DrawingInteractorProtocol = DrawingInteractor()
        let presenter: DrawingPresenterProtocol = DrawingPresenter(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        
        return view
    }
    
}
