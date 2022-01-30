//
//  RoundedButton.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 30.01.2022.
//

import UIKit

class RoundedButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        updateLayerProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.titleLabel?.font = Fonts.loraRegular
    }
    
    func updateLayerProperties() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 7
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.6
    }
    
}
