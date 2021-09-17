//
//  CustomizedTabBar.swift
//  SO
//
//  Created by So on 11/11/19.
//  Copyright © 2019 So Delhi. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class CustomizedTabBar: UITabBar {
    
    private var shapeLayer: CALayer?
    
//    @IBInspectable var height: CGFloat = 0.0
//
//       override func sizeThatFits(_ size: CGSize) -> CGSize {
//           var sizeThatFits = super.sizeThatFits(size)
//           if height > 0.0 {
//               sizeThatFits.height = height
//           }
//           return sizeThatFits
//       }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPathCircle()
        //shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        shapeLayer.shadowOpacity = 0.2
        shapeLayer.shadowOffset = CGSize(width: 1, height: -1)
        shapeLayer.shadowRadius = 2
        shapeLayer.fillColor = UIColor.white.cgColor
            //UIColor.white.cgColor

        //shapeLayer.lineWidth = 1.0
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    override func draw(_ rect: CGRect) {
        self.addShape()
    }

    
    func createPathCircle() -> CGPath {
        
        let radius: CGFloat = 35.0
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: (centerWidth - radius * 2), y: 0))
        path.addArc(withCenter: CGPoint(x: centerWidth, y: 0), radius: radius, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        return path.cgPath
    }
}

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
