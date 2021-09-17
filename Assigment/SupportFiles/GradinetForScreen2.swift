//
//  Gradient.swift
//  Assigment
//
//  Created by lov niveriya on 16/09/21.
//

import Foundation
import UIKit
class GradientViewScreen1: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 248/255, green: 251/255, blue: 255/255, alpha: 1).cgColor,UIColor(red: 225/255, green: 233/255, blue: 245/255, alpha: 1).cgColor]
    }
}

