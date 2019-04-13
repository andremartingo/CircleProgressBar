//
//  ViewController.swift
//  circleprogressbar
//
//  Created by André Martingo on 13/04/2019.
//  Copyright © 2019 André Martingo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let shapeLayer = CAShapeLayer()
    private let trackLayer = CAShapeLayer()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // draw circle

        let center = view.center

        let circularPath = UIBezierPath(arcCenter: center,
                                        radius: 100,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: true)

        // track layer

        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.lineCap = .round
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.path = circularPath.cgPath

        view.layer.addSublayer(trackLayer)

        // shape layer

        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.path = circularPath.cgPath

        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    @objc private func handleTap() {

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")

        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.add(basicAnimation, forKey: "basicAnimation")
    }
}

