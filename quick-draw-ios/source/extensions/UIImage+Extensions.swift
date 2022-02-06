//
//  UIImage+Extensions.swift
//  quick-draw-ios
//
//  Created by Betül Çalık on 6.02.2022.
//

import UIKit

extension UIImage {
    
    func resizeTo(size :CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    public func pixelBufferGray(width: Int, height: Int) -> CVPixelBuffer? {
        var pixelBuffer : CVPixelBuffer?
        let attributes = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue]
        
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(width), Int(height), kCVPixelFormatType_OneComponent8, attributes as CFDictionary, &pixelBuffer)
        
        guard status == kCVReturnSuccess, let imageBuffer = pixelBuffer else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        let imageData =  CVPixelBufferGetBaseAddress(imageBuffer)
        
        guard let context = CGContext(data: imageData, width: Int(width), height:Int(height),
                                      bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(imageBuffer),
                                      space: CGColorSpaceCreateDeviceGray(),
                                      bitmapInfo: CGImageAlphaInfo.none.rawValue) else {
            return nil
        }
        
        context.translateBy(x: 0, y: CGFloat(height))
        context.scaleBy(x: 1, y: -1)
        
        UIGraphicsPushContext(context)
        self.draw(in: CGRect(x:0, y:0, width: width, height: height) )
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress(imageBuffer, CVPixelBufferLockFlags(rawValue: 0))
        
        return imageBuffer
        
    }
    
}
