//
//  ColorHelper.swift
//  FIRE
//
//  Created by Tyler Clonts on 6/19/18.
//  Copyright © 2018 Tyler Clonts. All rights reserved.
//

import UIKit

extension UIColor {
        
    static let mmlightForestGreen = UIColor(red: 59.0/255.0, green: 148.0/255.0, blue: 94.0/255.0, alpha: 1.0)
    
    static let mmMiddleGreen = UIColor(red: 87.0/255.0, green: 186.0/255.0, blue: 152.0/255.0, alpha: 1.0)
    
    static let mmDarkGreen = UIColor(red: 24.0/255.0, green: 38.0/255.0, blue: 40.0/255.0, alpha: 1.0)
    
    static let mmTealBlue = UIColor(red: 101.0/255.0, green: 204.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    
    static let mmWhiteIce = UIColor(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
}

extension UINavigationBar {
    
    // MARK: - Background gradient
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
            
        layer.insertSublayer(gradientLayer, at: 0)
                layer.addSublayer(gradientLayer)
    }
    func setButtonGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

//extension UINavigationBar {
//    
//    func setGradientBackground(colors: [UIColor]) {
//        
//        var updatedFrame = bounds
//        updatedFrame.size.height += self.frame.origin.y
//        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
//        
//        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
//    }
//}
