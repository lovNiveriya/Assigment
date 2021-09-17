//
//  Gradient.swift
//  Assigment
//
//  Created by lov niveriya on 16/09/21.
//

import Foundation
import UIKit
class GradientView: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 9/255, green: 61/255, blue: 135/255, alpha: 1).cgColor,UIColor(red: 45/255, green: 121/255, blue: 230/255, alpha: 1).cgColor]
    }
  
}
