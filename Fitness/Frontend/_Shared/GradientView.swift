//
//  GradientView.swift
//  Fitness
//
//  Created by Kristopher Jackson on 10/29/20.
//

import UIKit

@IBDesignable class GradientView: UIView {
    
    @IBInspectable var topColor: UIColor = .clear {
        didSet {
            setGradient()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4) {
        didSet {
            setGradient()
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setGradient()
    }

    private func setGradient() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
        (layer as! CAGradientLayer).startPoint = CGPoint(x: 0.5, y: 0)
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 0.5, y: 1)
    }
}
