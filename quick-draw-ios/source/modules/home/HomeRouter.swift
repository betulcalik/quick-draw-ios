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
        let presenter: HomePresenterProtocol = HomePresenter(view: view,
                                                             router: router)
        view.presenter = presenter
        
        return view
    }
    
    func pushToDrawing(on view: HomeViewProtocol, with category: String) {
        let drawingVC = DrawingRouter.build(with: category)
        guard let homeVC = view as? HomeViewController else { return }
        
        homeVC.navigationController?.pushViewController(drawingVC, animated: true)
    }

}
