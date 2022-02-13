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
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            successPopup.dismiss(animated: true)
            self.pushToHome(on: view)
        }
    }
    
    func showErrorPopup(on view: DrawingViewProtocol) {
        let errorPopup = ErrorPopupViewController()
        guard let drawingVC = view as? DrawingViewController else { return }
        errorPopup.modalPresentationStyle = .overFullScreen
        
        drawingVC.navigationController?.present(errorPopup, animated: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            errorPopup.dismiss(animated: true)
            self.pushToHome(on: view)
        }
    }
    
    func pushToHome(on view: DrawingViewProtocol) {
        let homeVC = HomeRouter.build()
        guard let drawingVC = view as? DrawingViewController else { return }
        
        drawingVC.navigationController?.pushViewController(homeVC, animated: true)
    }
    
}
