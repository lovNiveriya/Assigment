//
//  Gradient.swift
//  Assigment
//
//  Created by lov niveriya on 16/09/21.
//

import Foundation
import UIKit
class GradientView1: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 45/255, green: 121/255, blue: 230/255, alpha: 1).cgColor,UIColor(red: 5/255, green: 52/255, blue: 118/255, alpha: 1).cgColor]
    }
}

