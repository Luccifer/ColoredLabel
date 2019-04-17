//
//  UIImage+Helpers.swift
//  ColoredLabel
//
//  Created by Gleb Karpushkin on 16/04/2019.
//  Copyright © 2019 Gleb Karpushkin. All rights reserved.
//

extension UIImage {
    
    private func averageOf(_ cgImage: CGImage) -> UIColor {
        
        var bitmap = [UInt8](repeating: 0, count: Constants.bytes)
        
        let context = CIContext(options: nil)
        
        let cgImg = context.createCGImage(CoreImage.CIImage(cgImage: cgImage), from: CoreImage.CIImage(cgImage: cgImage).extent)
        let inputImage = CIImage(cgImage: cgImg!)
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        
        let filter = CIFilter(name: Constants.filter, parameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent])!
        let outputImage = filter.outputImage!
        let outputExtent = outputImage.extent
        assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)
        
        context.render(outputImage, toBitmap: &bitmap, rowBytes: Constants.bytes, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: CIFormat.RGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())
        
        
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        
        return result
    }
    
    /// Get average color of Image's bitmap
    func averageColor() -> UIColor? {
        guard let cgImage = self.cgImage else {return nil}
        return averageOf(cgImage)
    }
}
