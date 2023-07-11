//
//  ErrorView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit


final class ErrorView: UIView {
        
    private let imageView = UIImageView()
    private let titleLabelView = UILabel()
    private let actionButtonView = UIButton()
    
    private var titleLabelText = "Network Error"
    private var buttonText = "Try again"
    private var buttonAction: (() -> Void)?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    convenience init(title titleText: String, buttonText: String, buttonAction: (() -> Void)?) {
        self.init(frame: CGRectZero)
        self.titleLabelText = titleText
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ErrorView {
    
    func setup() {
        setupImageView()
        setupTitleLabel()
        setupButton()
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "xmark.icloud")
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80)
        ])
        imageView.tintColor = .lightGray
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabelView)
        titleLabelView.text = titleLabelText
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.textColor = .red
        titleLabelView.font = UIFont(name: "Avenir Next Regular", size: 18)
        titleLabelView.textAlignment = .center
        titleLabelView.numberOfLines = 1
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            titleLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            titleLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
    }
    
    private func setupButton() {
        print()
        if (buttonAction == nil) {
            return
        }
        addSubview(actionButtonView)
        actionButtonView.translatesAutoresizingMaskIntoConstraints = false
        actionButtonView.setTitle(buttonText, for: .normal)
        actionButtonView.backgroundColor = .black
        actionButtonView.layer.cornerRadius = 8
        NSLayoutConstraint.activate([
            actionButtonView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: 30),
            actionButtonView.centerXAnchor.constraint(equalTo: centerXAnchor),
            actionButtonView.widthAnchor.constraint(equalToConstant: 140),
            actionButtonView.heightAnchor.constraint(equalToConstant: 48)
        ])
        actionButtonView.addTarget(self, action: #selector(actionButtonHandler), for: .touchUpInside)
    }
    
}


private extension ErrorView {
    
    @objc private func actionButtonHandler() {
        if let buttonAction = buttonAction {
            buttonAction()
        }
    }

}

extension ErrorView {
        
    func updateWith(buttonAction: (() -> Void)?) {
        self.buttonAction = buttonAction
        setupButton()
    }
    
    func updateWith(title titleText: String, buttonAction: (() -> Void)?) {
        self.titleLabelText = titleText
        self.buttonAction = buttonAction
    }
    
    func updateWith(title titleText: String, buttonText: String, buttonAction: (() -> Void)?) {
        self.titleLabelText = titleText
        self.buttonText = buttonText
        self.buttonAction = buttonAction
    }
    
}

