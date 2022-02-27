//
//  CokeView.swift
//  LayerBasedAnimationStudy
//
//  Created by 유재호 on 2022/02/26.
//

import UIKit

final class CokeView: UIView {
    
    func drawBottleLayer() {
        let width = bounds.width
        let height = bounds.height
        
        let bottlePath: UIBezierPath = {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: width * 0.1, y: height * 0.3))
            path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.75))
            path.addQuadCurve(to: CGPoint(x: width * 0.6, y: height * 0.75), controlPoint: CGPoint(x: width * 0.4, y: height * 0.8))
            // 회전 포인트
            path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.3))
            return path
        }()
        
        let bottleLayer: CAShapeLayer = {
            let layer = CAShapeLayer()
            layer.path = bottlePath.cgPath
            layer.lineWidth = 10
            layer.strokeColor = UIColor.systemGray.cgColor
            layer.fillColor = UIColor.clear.cgColor
            layer.lineJoin = .round
            layer.lineCap = .butt
            return layer
        }()
        
        self.layer.addSublayer(bottleLayer)
    }
    
    func drawStrawLayer() {
        let width = bounds.width
        let height = bounds.height
        
        let strawPath: UIBezierPath = {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: width * 0.4, y: height * 0.75))
            path.addLine(to: CGPoint(x: width * 0.66, y: height * 0.29))
            path.addLine(to: CGPoint(x: width * 0.84, y: height * 0.24))
            return path
        }()
        
        let strawLayer: CAShapeLayer = {
            let layer = CAShapeLayer()
            layer.path = strawPath.cgPath
            layer.lineWidth = 15
            layer.strokeColor = UIColor.darkGray.cgColor
            layer.fillColor = UIColor.clear.cgColor
            layer.lineJoin = .round
            layer.lineCap = .round
            return layer
        }()
        
        self.layer.addSublayer(strawLayer)
    }
    
    func drawCokeLayer() {
        let width = bounds.width
        let height = bounds.height
        
        let bottlePath: UIBezierPath = {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: width * 0.1, y: height * 0.3))
            path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.75))
            path.addQuadCurve(to: CGPoint(x: width * 0.6, y: height * 0.75), controlPoint: CGPoint(x: width * 0.4, y: height * 0.8))
            path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.3))
            return path
        }()
        
        let bottleLayer: CAShapeLayer = {
            let layer = CAShapeLayer()
            layer.path = bottlePath.cgPath
            layer.lineWidth = 10
            layer.strokeColor = UIColor.systemGray.cgColor
            // layer.fillColor = UIColor.clear.cgColor
            layer.lineJoin = .round
            layer.lineCap = .butt
            return layer
        }()

        let cokePath: UIBezierPath = {
            let path = UIBezierPath()
            path.move(to: CGPoint(x: width * 0.1, y: height * 0.35))
            path.addLine(to: CGPoint(x: width * 0.1, y: height * 0.8))
            path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.8))
            path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.35))
            return path
        }()

        let cokeLayer: CAShapeLayer = {
            let layer = CAShapeLayer()
            layer.path = cokePath.cgPath
            layer.fillColor = UIColor.brown.cgColor
            layer.mask = bottleLayer
            return layer
        }()
        
        // 아래에서 위로 채워지는 애니메이션
//        let fillingAnimation = CABasicAnimation(keyPath: "bounds")
//        fillingAnimation.fromValue = CGSize(width: width, height: 0)
//        fillingAnimation.toValue = CGSize(width: width, height: 200)
//        fillingAnimation.duration = 1
//        fillingAnimation.repeatCount = 10
//        fillingAnimation.fillMode = .forwards
        
//        cokeLayer.add(fillingAnimation, forKey: nil)
        self.layer.addSublayer(cokeLayer)
    }
}

