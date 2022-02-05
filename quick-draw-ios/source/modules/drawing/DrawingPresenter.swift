//
//  TodoPresenter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

class DrawingPresenter: DrawingPresenterProtocol {
    
    // MARK: - Variables
    weak var view: DrawingViewProtocol?
    private let interactor: DrawingInteractorProtocol
    private let router: DrawingRouterProtocol
    
    init(view: DrawingViewProtocol,
         interactor: DrawingInteractorProtocol,
         router: DrawingRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
