//
//  TodoPresenter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

class TodoPresenter: TodoPresenterProtocol {
    
    // MARK: - Variables
    weak var view: TodoViewProtocol?
    private let interactor: TodoInteractorProtocol
    private let router: TodoRouterProtocol
    
    init(view: TodoViewProtocol,
         interactor: TodoInteractorProtocol,
         router: TodoRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}
