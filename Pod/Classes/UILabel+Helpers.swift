//
//  UILabel+Helpers.swift
//  ColoredLabel
//
//  Created by Gleb Karpushkin on 16/04/2019.
//  Copyright © 2019 Gleb Karpushkin. All rights reserved.
//

public extension UILabel {
    
    /// Some people report that 0.7 as threshhold is best. We suggest to find out for yourself.
    /// Default are black for light and white for dark, 0.5 as threshhold
    func colorLabelIfNeededWith(image: UIImage, colorIfImageIsLight: UIColor = UIColor.black, colorIfImageIsDark: UIColor = UIColor.white, lightThreshhold: Float = 0.5) {
        guard let color = image.averageColor() else {return}
        if #available(iOS 9.0, *) {
            guard let light = color.isLight(threshold: lightThreshhold) else {return}
            self.textColor = light ? colorIfImageIsLight : colorIfImageIsDark
        } else {
            // Fallback on earlier versions
        }
       
    }
    
}
