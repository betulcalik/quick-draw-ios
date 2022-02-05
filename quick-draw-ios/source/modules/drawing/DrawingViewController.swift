//
//  TodoViewController.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import UIKit

class DrawingViewController: UIViewController {

    // MARK: - Components
    private lazy var guessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "deneme"
        label.font = Fonts.handwriting
        return label
    }()
    
    private lazy var canvasView: CanvasView = {
        let canvas = CanvasView()
        canvas.translatesAutoresizingMaskIntoConstraints = false
        canvas.backgroundColor = .white
        return canvas
    }()
    
    private lazy var clearButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Clear", for: .normal)
        button.backgroundColor = Colors.purple
        button.addTarget(self, action: #selector(clearButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButton: RoundedButton = {
        let button = RoundedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Next", for: .normal)
        button.backgroundColor = Colors.purple
        button.addTarget(self, action: #selector(nextButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 15
        return stackView
    }()
    
    // MARK: - Variables
    var presenter: DrawingPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = Colors.yellow
        setLargeTitle()
        addButtonsToStackView()
        addComponentsToContentStackView()
    }
    
    private func setLargeTitle() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.title = "Let's Draw: "
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addButtonsToStackView() {
        buttonsStackView.addArrangedSubview(clearButton)
        buttonsStackView.addArrangedSubview(nextButton)
        view.addSubview(buttonsStackView)
    }
    
    private func addComponentsToContentStackView() {
        contentStackView.addArrangedSubview(guessLabel)
        contentStackView.addArrangedSubview(canvasView)
        contentStackView.addArrangedSubview(buttonsStackView)
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            guessLabel.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            guessLabel.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            canvasView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    @objc func clearButtonAction() {
        print("clear")
    }
    
    @objc func nextButtonAction() {
        print("next")
    }

}

// MARK : - Todo View Protocol
extension DrawingViewController: DrawingViewProtocol {
    
}
