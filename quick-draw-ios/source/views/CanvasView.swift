//
//  CanvasView.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 3.02.2022.
//

import UIKit

class CanvasView: UIView {
    
    // MARK: - Variables
    private var lines = [[CGPoint]]()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        context.setLineWidth(5)
        context.setLineCap(.round) // butt
        lines.forEach { (line) in
            for (i, p) in line.enumerated() {
                if i == 0 {
                    context.move(to: p)
                }
                context.addLine(to: p)
            }
        }
        context.strokePath()
        updateLayoutProperties()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self) else { return }
        guard var lastLine = lines.popLast() else { return }
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        NotificationCenter.default.post(name: .didTouchesMoved, object: nil)
    }
    
    private func updateLayoutProperties() {
        layer.masksToBounds = false
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 2, height: 2)
        layer.shouldRasterize = true
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.6
    }
    
    func clearCanvas() {
        lines.removeAll()
        setNeedsDisplay()
    }
    
}
