//
//  ViewController.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 30.01.2022.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Components
    private lazy var drawLabel: UILabel = {
        let label = UILabel()
        label.text = "Draw"
        label.font = Fonts.loraRegular
        return label
    }()
    
    private lazy var challengeLabel: UILabel = {
        let label = UILabel()
        label.text = Categories.getRandom
        label.font = Fonts.handwriting
        return label
    }()
    
    private lazy var startButton: RoundedButton = {
        let button = RoundedButton()
        button.setTitle("got it!", for: .normal)
        button.backgroundColor = Colors.purple
        button.widthAnchor.constraint(equalToConstant: 200).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.addTarget(self, action: #selector(gotItAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 17
        return stackView
    }()
    
    // MARK: - Variables
    var presenter: HomePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateCategory()
        setCategory()
    }

    // MARK: - Setup UI
    private func setupUI() {
        view.backgroundColor = Colors.yellow
        addViewsToStackView()
        addConstraints()
    }
    
    private func addViewsToStackView() {
        contentStackView.addArrangedSubview(drawLabel)
        contentStackView.addArrangedSubview(challengeLabel)
        contentStackView.addArrangedSubview(startButton)
        view.addSubview(contentStackView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // MARK: - Actions
    @objc func gotItAction() {
        pushToDrawing()
    }
}

// MARK: - Home View Protocol
extension HomeViewController: HomeViewProtocol {
    func setCategory() {
        guard let category = challengeLabel.text else { return }
        presenter?.setCategory(category: category)
    }
    
    func updateCategory() {
        challengeLabel.text = Categories.getRandom
    }
    
    func pushToDrawing() {
        presenter?.pushToDrawing()
    }
}
