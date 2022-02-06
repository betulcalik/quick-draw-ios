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
        titleLabel?.font = Fonts.loraRegular
    }
    
    func updateLayerProperties() {
        layer.masksToBounds = false
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shouldRasterize = true
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.6
    }
    
}
