//
//  WaveView.swift
//  WaveViewApp
//
//  Created by Alex Mochalov on 17/02/2021.
//

import UIKit

class WaveView: UIView {
    
    enum Direction {
        case right
        case left
    }
    
    private weak var displayLink: CADisplayLink?
    private var startTime: CFTimeInterval = 0
    
    var myLayer = CAShapeLayer()
    var gradient = CAGradientLayer()
    
    var speed: Double = 10 // 0 - static, 20 - very fast
    var frequency = 8.0
    var parameterA = 1.5
    var parameterB = 9.0
    var phase = 0.0
    
    private func startDisplayLink() {
            startTime = CACurrentMediaTime()
            self.displayLink?.invalidate()
            let displayLink = CADisplayLink(target: self, selector:#selector(handleDisplayLink(_:)))
            displayLink.add(to: .main, forMode: .common)
            self.displayLink = displayLink
    }
    
    @objc private func handleDisplayLink(_ displayLink: CADisplayLink) {
        self.phase = (CACurrentMediaTime() - startTime) * self.speed
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.setNeedsDisplay()
    }
    
    private func stopDisplayLink() {
           displayLink?.invalidate()
    }
    
    func animationStart(direction: Direction, speed: Double) {
        if direction == .right {
            self.speed = -speed
        } else {
            self.speed = speed
        }
        self.startDisplayLink()
    }
    
    override func draw(_ rect: CGRect) {
//        self.backgroundColor = .yellow
        let path = UIBezierPath()
        myLayer.frame = rect
        gradient.frame = rect
        let width = Double(self.frame.width)
        let height = Double(self.frame.height)
        
        let yOffset: CGFloat = 80.s
        
        let waveLength = width / self.frequency
        let waveHeightCoef = Double(self.frequency)
        path.move(to: CGPoint(x: 0, y: height))
        path.addLine(to: CGPoint(x: 0, y: yOffset))
        
        for x in stride(from: 0, through: width, by: 1) {
            let actualX = x / waveLength
            let sine = -cos(self.parameterA*(actualX + self.phase)) * sin((actualX + self.phase)/self.parameterB)
            let y = waveHeightCoef * sine + yOffset - (70 - x*0.15).s
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.addLine(to: CGPoint(x: CGFloat(width), y: yOffset))
        path.addLine(to: CGPoint(x: CGFloat(width), y: height))
        
        myLayer.path = path.cgPath
        myLayer.fillColor = AppColors.background.cgColor
        myLayer.strokeColor = UIColor.clear.cgColor
        //rgba(7,21,50,255)
        gradient.colors = [UIColor.clear.cgColor, AppColors.e2C6.cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 1)
        gradient.endPoint = CGPoint(x: 0.5, y: 0)
        gradient.mask = myLayer
        
        self.layer.addSublayer(self.gradient)
    }
}

