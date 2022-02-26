//
//  CokeView.swift
//  LayerBasedAnimationStudy
//
//  Created by 유재호 on 2022/02/26.
//

import UIKit

final class CokeView: UIView {
    
//    let straw = CAShapeLayer()
//    let coke = CAShapeLayer()
//    let maskingLayer = CAShapeLayer()
    
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
}

