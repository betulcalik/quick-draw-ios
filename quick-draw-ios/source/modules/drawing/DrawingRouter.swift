//
//  TodoRouter.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import Foundation

class DrawingRouter: DrawingRouterProtocol {
    
    static func build(with category: String) -> DrawingViewController {
        let view = DrawingViewController()
        let router: DrawingRouterProtocol = DrawingRouter()
        let interactor: DrawingInteractorProtocol = DrawingInteractor()
        let presenter: DrawingPresenterProtocol = DrawingPresenter(view: view,
                                                                   interactor: interactor,
                                                                   router: router,
                                                                   category: category)
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
    
    func showSuccessPopup(on view: DrawingViewProtocol) {
        let successPopup = SuccessPopupViewController()
        guard let drawingVC = view as? DrawingViewController else { return }
        successPopup.modalPresentationStyle = .overFullScreen
        
        drawingVC.navigationController?.present(successPopup, animated: true)
    }
    
    func pushToHome(on view: DrawingViewProtocol) {
        let homeVC = HomeRouter.build()
        guard let drawingVC = view as? DrawingViewController else { return }
        
        drawingVC.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
