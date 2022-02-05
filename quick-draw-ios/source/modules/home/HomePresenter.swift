//
//  HomePresenter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 30.01.2022.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    // MARK: - Variables
    weak var view: HomeViewProtocol?
    private let router: HomeRouterProtocol
    
    init(view: HomeViewProtocol,
         router: HomeRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func pushToDrawing() {
        guard let view = view else { return }
        router.pushToDrawing(on: view)
    }
    
}
