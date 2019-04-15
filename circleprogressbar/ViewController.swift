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

    private let linearTrackLayer = CAShapeLayer()
    private let linearShapeLayer = CAShapeLayer()

    private let linearProgressView = UIProgressView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        circularShape()
        linearShape()
        progressView()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    }

    private func progressView() {

        view.addSubview(linearProgressView)

        linearProgressView.translatesAutoresizingMaskIntoConstraints = false
        linearProgressView.setProgress(0.5, animated: false)
        linearProgressView.layer.cornerRadius = 4
        linearProgressView.clipsToBounds = true

        NSLayoutConstraint.activate([
            // Place the button at the center of its parent
            linearProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            linearProgressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            // Give the label a minimum width based on the button’s width
            linearProgressView.heightAnchor.constraint(greaterThanOrEqualToConstant: 8),
            linearProgressView.widthAnchor.constraint(greaterThanOrEqualToConstant: 115)
        ])
    }

    private func circularShape() {
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
    }

    private func linearShape() {

        let rectPath = UIBezierPath(roundedRect: CGRect(x: view.center.x - 50, y: 100, width: 115, height: 8),
                                    cornerRadius: 12)

        let newPath = UIBezierPath(roundedRect: CGRect(x: view.center.x - 50, y: 100, width: 150, height: 8),
                                   cornerRadius: 12)

        // linear track layer

        linearTrackLayer.strokeColor = UIColor.lightGray.cgColor
        linearTrackLayer.lineWidth = 1
        linearTrackLayer.lineCap = .round
        linearTrackLayer.fillColor = UIColor.clear.cgColor
        linearTrackLayer.path = newPath.cgPath

        view.layer.addSublayer(linearTrackLayer)

        // shape layer

        linearShapeLayer.strokeColor = UIColor.green.cgColor
        linearShapeLayer.lineWidth = 1
        linearShapeLayer.strokeEnd = 1
        linearShapeLayer.lineCap = .round
        linearShapeLayer.fillColor = UIColor.green.cgColor
        linearShapeLayer.path = rectPath.cgPath

        view.layer.addSublayer(linearShapeLayer)
    }

    @objc private func handleTap() {

        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")

        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false

        shapeLayer.add(basicAnimation, forKey: "basicAnimation")

        let newPath = UIBezierPath(roundedRect: CGRect(x: view.center.x - 50, y: 100, width: 150, height: 8),
                                   cornerRadius: 12)

        let linearAnimation = CABasicAnimation(keyPath: "path")

        linearAnimation.toValue = newPath.cgPath
        linearAnimation.duration = 0.3
        linearAnimation.fillMode = .forwards
        linearAnimation.isRemovedOnCompletion = false

        linearShapeLayer.add(linearAnimation, forKey: linearAnimation.keyPath)

        linearProgressView.setProgress(1, animated: true)
    }
}

