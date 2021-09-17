//
//  Gradient.swift
//  Assigment
//
//  Created by lov niveriya on 16/09/21.
//

import Foundation
import UIKit
class GradientView2: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 61/255, green: 139/255, blue: 255/255, alpha: 1).cgColor,UIColor(red: 27/255, green: 105/255, blue: 199/255, alpha: 1).cgColor]
    }
}

