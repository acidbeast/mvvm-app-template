//
//  IndicatorView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit
import CoreGraphics

final class IndicatorView: UIView {
    
    var animations = [CABasicAnimation]()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Setup
private extension IndicatorView {
    
    func setup() {
        setupConstrains()
        setupCircles()
        setupAnimations()
    }
    
    private func setupConstrains() {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 65),
            heightAnchor.constraint(equalToConstant: 15),
        ])
    }
    
    private func setupCircles() {
        for i in 0...2 {
            let circleView = UIView()
            addSubview(circleView)
            circleView.backgroundColor = .darkGray
            circleView.frame = CGRect(x: i * 25, y: 0, width: 15, height: 15)
            circleView.layer.cornerRadius = 7.5
        }
    }
    
}

// MARK: - Animations
extension IndicatorView {
    
    private func createAnimation(
        with view: UIView,
        delay: Int
    ) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "position")
        let startPosition = view.layer.position
        animation.fromValue = CGPoint(x: startPosition.x, y: startPosition.y)
        animation.toValue = CGPoint(x: startPosition.x, y: startPosition.y - 5)
        animation.duration = 0.5
        animation.autoreverses = true
        animation.repeatCount = .infinity
        animation.beginTime = CACurrentMediaTime() + (CGFloat(delay) * 0.3) + 0.5
        return animation
    }
    
    private func setupAnimations() {
        subviews.enumerated().forEach { (index, item) in
            let animation = self.createAnimation(with: item, delay: index)
            animations.append(animation)
        }
    }
    
    
    func playAnimation() {
        subviews.enumerated().forEach { (index, item) in
            item.layer.add(animations[index], forKey: nil)
        }
    }
    
    func stopAnimation() {
        subviews.forEach { item in
            item.layer.removeAllAnimations()
        }
    }

}

