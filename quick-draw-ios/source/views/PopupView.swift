//
//  PopupView.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 11.02.2022.
//

import UIKit

class PopupView: UIView {
    
    private lazy var popupImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var popupText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Fonts.loraRegular?.withSize(20)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    init(image: UIImage?, text: String) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setupUI(image, text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(_ image: UIImage?, _ text: String) {
        backgroundColor = .white
        layer.cornerRadius = 7
        popupImage.image = image
        popupText.text = text
        setupConstraints()
    }
    
    private func setupConstraints() {
        self.addSubview(popupImage)
        self.addSubview(popupText)
        NSLayoutConstraint.activate([
            popupImage.bottomAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            popupImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popupText.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            popupText.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
