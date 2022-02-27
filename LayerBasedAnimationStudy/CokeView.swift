//
//  CokeView.swift
//  LayerBasedAnimationStudy
//
//  Created by 유재호 on 2022/02/26.
//

import UIKit

final class CokeView: UIView {
    
    lazy var width = bounds.width
    lazy var height = bounds.height
    
    lazy var bottlePath: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.1, y: height * 0.3))
        path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.75))
        path.addQuadCurve(to: CGPoint(x: width * 0.6, y: height * 0.75), controlPoint: CGPoint(x: width * 0.4, y: height * 0.8))
        // 회전 포인트
        path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.3))
        return path
    }()
    
    lazy var bottleLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = bottlePath.cgPath
        layer.lineWidth = 10
        layer.strokeColor = UIColor.systemGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineJoin = .round
        layer.lineCap = .butt
        return layer
    }()
    
    lazy var strawPath: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.4, y: height * 0.75))
        path.addLine(to: CGPoint(x: width * 0.66, y: height * 0.29))
        path.addLine(to: CGPoint(x: width * 0.84, y: height * 0.24))
        return path
    }()
    
    lazy var strawLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = strawPath.cgPath
        layer.lineWidth = 15
        layer.strokeColor = UIColor.darkGray.cgColor
        layer.fillColor = UIColor.clear.cgColor
        layer.lineJoin = .round
        layer.lineCap = .round
        return layer
    }()
    
    lazy var maskPath: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.1, y: height * 0.35))
        path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.75))
        path.addQuadCurve(to: CGPoint(x: width * 0.6, y: height * 0.75), controlPoint: CGPoint(x: width * 0.4, y: height * 0.8))
        path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.35))
        return path
    }()

    lazy var maskLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = maskPath.cgPath
        layer.lineWidth = 10
        layer.strokeColor = UIColor.systemGray.cgColor
        layer.lineJoin = .round
        layer.lineCap = .butt
        return layer
    }()
    
    lazy var cokePath: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.1, y: height * 0.3))
        path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.75))
        path.addQuadCurve(to: CGPoint(x: width * 0.6, y: height * 0.75), controlPoint: CGPoint(x: width * 0.4, y: height * 0.8))
        path.addLine(to: CGPoint(x: width * 0.7, y: height * 0.3))
        return path
    }()

    lazy var cokeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = cokePath.cgPath
        layer.fillColor = UIColor.brown.cgColor
        layer.mask = maskLayer
        return layer
    }()
    
    // MARK: - 그리기 메서드
    
    func drawBottleLayer() {
        self.layer.addSublayer(bottleLayer)
    }
    
    func drawStrawLayer() {
        self.layer.addSublayer(strawLayer)
    }
    
    func drawCokeLayer() {
        self.layer.addSublayer(cokeLayer)
    }
    
    func drinkCoke() {
        let drinkingCokeAnimation = CABasicAnimation(keyPath: "position.y")
        drinkingCokeAnimation.fromValue = 0
        drinkingCokeAnimation.toValue = height * 0.45
        drinkingCokeAnimation.duration = 1
        drinkingCokeAnimation.fillMode = .forwards
        drinkingCokeAnimation.isRemovedOnCompletion = false
        maskLayer.add(drinkingCokeAnimation, forKey: nil)
    }
    
    func fillCoke() {
        let fillingCokeAnimation = CABasicAnimation(keyPath: "position.y")
        fillingCokeAnimation.fromValue = height * 0.45
        fillingCokeAnimation.toValue = 0
        fillingCokeAnimation.duration = 1
        fillingCokeAnimation.fillMode = .forwards
        fillingCokeAnimation.isRemovedOnCompletion = false
        maskLayer.add(fillingCokeAnimation, forKey: nil)
    }
}

