//
//  ViewController.swift
//  LayerBasedAnimationStudy
//
//  Created by 유재호 on 2022/02/26.
//

import UIKit

class ViewController: UIViewController {
    
     let cokeView = CokeView(frame: CGRect(origin: .zero, size: .zero))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 프레임이 없다! origin, size 를 정해주지 않았기 때문에 bounds 가 0 이다.
        view.addSubview(cokeView)
        cokeView.backgroundColor = .systemGray6
        cokeView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            cokeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cokeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            cokeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            cokeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    // viewWillAppear 쯤에서 Rect 를 만들어준다.
    // viewWillAppear 에서 오토레이아웃도 조정됨.
    // 그래서 일부러 viewDidAppear 에서 해보자.
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cokeView.drawStrawLayer()
        cokeView.drawCokeLayer()
        cokeView.drawBottleLayer()
    }

}

