//
//  LoadingView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit


final class LoadingView: UIView {
    
    let textLabel = UILabel()
    let indicatorView = IndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


// MARK: - Setup
private extension LoadingView {
        
    func setup() {
        setupTextLabelView()
        setupLoaderView()
    }
        
    private func setupTextLabelView() {
        addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "LOADING"
        textLabel.font = UIFont(name: "Avenir Next Regular", size: 18.0)
        textLabel.textColor = .darkGray
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setupLoaderView() {
        addSubview(indicatorView)
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicatorView.centerXAnchor.constraint(equalTo: centerXAnchor),
            indicatorView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 30)
        ])
    }
    
}

// MARK: - Animation
extension LoadingView {
    func playAnimation() {
        indicatorView.playAnimation()
    }
}
