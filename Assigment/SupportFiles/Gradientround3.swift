//
//  Gradient.swift
//  Assigment
//
//  Created by lov niveriya on 16/09/21.
//

import Foundation
import UIKit
class GradientView3: UIView {
    override open class var layerClass: AnyClass {
       return CAGradientLayer.classForCoder()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       // configure()
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor(red: 19/255, green: 76/255, blue: 157/255, alpha: 1).cgColor,UIColor(red: 45/255, green: 121/255, blue: 230/255, alpha: 1).cgColor]
    }
//    private var shapeLayer: CAShapeLayer = {
//          let shapeLayer = CAShapeLayer()
//          shapeLayer.strokeColor = UIColor.white.cgColor
//          shapeLayer.fillColor = UIColor.clear.cgColor
//          shapeLayer.lineWidth = 3
//        shapeLayer.lineCap = .butt
//        shapeLayer.lineDashPattern = [7, 10]
//
//          return shapeLayer
//      }()
//
//      override init(frame: CGRect = .zero) {
//          super.init(frame: frame)
//          configure()
//      }
//
//      override func layoutSubviews() {
//          super.layoutSubviews()
//          updatePath()
//      }
}

extension GradientView3{
//    func configure() {
//           layer.addSublayer(shapeLayer)
//       }
//
//       func updatePath() {
//           let rect = bounds.insetBy(dx: shapeLayer.lineWidth / 2, dy: shapeLayer.lineWidth / 2)
//           let radius = min(rect.width, rect.height) / 2
//           let center = CGPoint(x: rect.midX, y: rect.midY)
//           let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: .pi * 2, clockwise: true)
//           shapeLayer.path = path.cgPath
//       }
}
