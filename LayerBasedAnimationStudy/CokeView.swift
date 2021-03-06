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
    
    // MARK: - 컵
    
    lazy var bottlePath: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: width * 0.1, y: height * 0.3))
        path.addLine(to: CGPoint(x: width * 0.2, y: height * 0.75))
        path.addQuadCurve(to: CGPoint(x: width * 0.6, y: height * 0.75), controlPoint: CGPoint(x: width * 0.4, y: height * 0.8))
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
    
    // MARK: - 빨대
    
    lazy var strawPath: UIBezierPath = {
        let path = UIBezierPath()
        // 기존 좌표에서 이동한 position 만큼 x, y 축에서 빼준다 -> 좌상단으로 그림이 이동함!
        path.move(to: CGPoint(x: width * (0.4 - 0.66), y: height * (0.75 - 0.29)))
        path.addLine(to: CGPoint(x: width * (0.66 - 0.66), y: height * (0.29 - 0.29)))
        path.addLine(to: CGPoint(x: width * (0.84 - 0.66), y: height * (0.24 - 0.29)))
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
        // layer.anchorPoint 위치 == layer.position 위치
        // layer 에 프레임이 없다보니, anchorPoint 는 변경되지 않았음.
        // 따라서 layer.position 자체를 빨대의 관절 부분으로 옮김 -> 빨대가 우측 하단으로 멀리 이동함
        // position 이 우하단으로 이동했으니, path 는 좌상단으로 동일한 x, y축 만큼 옮겨줄 필요가 있었음
        layer.position = CGPoint(x: width * 0.66, y: height * 0.29)
        return layer
    }()
    
    // MARK: - 컵 모양 마스크
    
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
    
    // MARK: - 콜라 음료
    
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
    
    // MARK: - 애니메이션 메서드
    
    func drinkCoke() {
        let drinkingCokeAnimation = CABasicAnimation(keyPath: "position.y")
        drinkingCokeAnimation.fromValue = 0
        drinkingCokeAnimation.toValue = height * 0.45
        drinkingCokeAnimation.duration = 1
        drinkingCokeAnimation.fillMode = .forwards
        drinkingCokeAnimation.isRemovedOnCompletion = false
        maskLayer.add(drinkingCokeAnimation, forKey: nil)
        downStraw()
    }
    
    func fillCoke() {
        let fillingCokeAnimation = CABasicAnimation(keyPath: "position.y")
        fillingCokeAnimation.fromValue = height * 0.45
        fillingCokeAnimation.toValue = 0
        fillingCokeAnimation.duration = 1
        fillingCokeAnimation.fillMode = .forwards
        fillingCokeAnimation.isRemovedOnCompletion = false
        maskLayer.add(fillingCokeAnimation, forKey: nil)
        upStraw()
    }
    
    func upStraw() {
        let upStrawAnimation = CABasicAnimation(keyPath: "transform.rotation")
        upStrawAnimation.fromValue = 0
        upStrawAnimation.toValue = Float.pi / 16
        upStrawAnimation.duration = 1
        upStrawAnimation.fillMode = .forwards
        upStrawAnimation.isRemovedOnCompletion = false
        strawLayer.add(upStrawAnimation, forKey: nil)
    }
    
    func downStraw() {
        let downStrawAnimation = CABasicAnimation(keyPath: "transform.rotation")
        downStrawAnimation.fromValue = Float.pi / 16
        downStrawAnimation.toValue = 0
        downStrawAnimation.duration = 1
        downStrawAnimation.fillMode = .forwards
        downStrawAnimation.isRemovedOnCompletion = false
        strawLayer.add(downStrawAnimation, forKey: nil)
    }
}

