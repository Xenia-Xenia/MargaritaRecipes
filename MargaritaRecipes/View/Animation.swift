//
//  MargaritaButton.swift
//  MargaritaRecipes
//
//  Created by Ксения Загарьева on 02.02.2024.
//

import UIKit

extension UIView {

    func doGlowAnimation(withColor color: UIColor) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowRadius = .zero
        layer.shadowOpacity = 0.8
        layer.shadowOffset = .zero
    
        let glowAnimation = CABasicAnimation(keyPath: "shadowRadius")
        glowAnimation.fromValue = 1
        glowAnimation.toValue = 10
        glowAnimation.duration = CFTimeInterval(2)
        glowAnimation.autoreverses = true
        glowAnimation.repeatCount = Float.greatestFiniteMagnitude
        layer.add(glowAnimation, forKey: "shadowGlowingAnimation")
    }
}
