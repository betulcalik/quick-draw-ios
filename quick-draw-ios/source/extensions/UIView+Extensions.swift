//
//  UIView+Extensions.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 6.02.2022.
//

import UIKit

extension UIView {
    
    func uiImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: self.bounds.size)
        return renderer.image { (context) in
            self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }
    
}
