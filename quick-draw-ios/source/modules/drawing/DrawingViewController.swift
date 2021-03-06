//
//  TodoViewController.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 2.02.2022.
//

import UIKit
import CountdownLabel

class DrawingViewController: UIViewController {

    // MARK: - Components
    private lazy var countdownLabel: CountdownLabel = {
        let label = CountdownLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.animationType = .Anvil
        label.font = Fonts.loraRegular
        label.textAlignment = .center
        label.timeFormat = "mm:ss"
        label.setCountDownTime(minutes: 25)
        label.start()
        return label
    }()
    
    private lazy var guessLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting..."
        label.font = Fonts.handwriting?.withSize(27)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 30
        return stackView
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
        getCategory()
        setObservers()
        setDelegates()
        setLargeTitle()
        addLabelsToStackView()
        addButtonsToStackView()
        addComponentsToContentStackView()
    }

    private func setObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(didTouchesEnded), name: .didTouchesEnded, object: nil)
    }
    
    private func setDelegates() {
        countdownLabel.countdownDelegate = self
    }
    
    private func setLargeTitle() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func addLabelsToStackView() {
        labelsStackView.addArrangedSubview(countdownLabel)
        labelsStackView.addArrangedSubview(guessLabel)
        view.addSubview(labelsStackView)
    }
    
    private func addButtonsToStackView() {
        buttonsStackView.addArrangedSubview(clearButton)
        buttonsStackView.addArrangedSubview(nextButton)
        view.addSubview(buttonsStackView)
    }
    
    private func addComponentsToContentStackView() {
        contentStackView.addArrangedSubview(labelsStackView)
        contentStackView.addArrangedSubview(canvasView)
        contentStackView.addArrangedSubview(buttonsStackView)
        view.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            contentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35),
            labelsStackView.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            labelsStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            canvasView.widthAnchor.constraint(equalTo: contentStackView.widthAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: contentStackView.bottomAnchor)
        ])
    }
    
    private func clearCanvas() {
        canvasView.clearCanvas()
    }
    
    // MARK: - Actions
    @objc func clearButtonAction() {
        guessLabel.text = "Waiting..."
        clearCanvas()
    }
    
    @objc func nextButtonAction() {
        clearCanvas()
        countdownLabel.pause()
        presenter?.pushToHome()
    }

    @objc func didTouchesEnded() {
        let result = presenter?.getClassifyResult(with: canvasView)
        let category = presenter?.category
        guessLabel.text = result

        if result == category {
            presenter?.showSuccessPopup()
        }
    }
}

// MARK : - Todo View Protocol
extension DrawingViewController: DrawingViewProtocol {
    func getCategory() {
        let category = presenter?.category
        navigationItem.title = "Let's Draw: " + (category ?? "")
    }
}

// MARK: - Countdown Delegate
extension DrawingViewController: CountdownLabelDelegate {
    func countingAt(timeCounted: TimeInterval, timeRemaining: TimeInterval) {
        if timeRemaining == 10 {
            self.countdownLabel.animationType = .Pixelate
            self.countdownLabel.textColor = .red
        }
    }
    
    func countdownFinished() {
        let result = presenter?.getClassifyResult(with: canvasView)
        let category = presenter?.category
        
        if result != category {
            presenter?.showErrorPopup()
        }
    }
}
