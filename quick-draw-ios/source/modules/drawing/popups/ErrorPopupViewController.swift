//
//  ErrorPopupViewController.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 13.02.2022.
//

import UIKit

class ErrorPopupViewController: UIViewController {

    // MARK: - UI Components
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.backgroundColor = .clear
        blurEffectView.alpha = 0.75
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return blurEffectView
    }()

    private lazy var popupView: PopupView = {
        let popupView = PopupView(image: UIImage(named: "oops"),
                                  text: "No problem, let's\n try that again!")
        popupView.translatesAutoresizingMaskIntoConstraints = false
        return popupView
    }()
    
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        addBlurEffectViewToView()
        addPopupViewToView()
        addConstraints()
    }
    
    private func addBlurEffectViewToView() {
        view.addSubview(blurEffectView)
    }
    
    private func addPopupViewToView() {
        view.addSubview(popupView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            popupView.widthAnchor.constraint(equalToConstant: 270),
            popupView.heightAnchor.constraint(equalToConstant: 200),
            popupView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            popupView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

}
