//
//  PostView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit


final class PostFullView: UIView {
    
    private let titleLabelView = UILabel()
    private let bodyLabelView = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PostFullView {
    
    func setup() {
        setupTitleLabel()
        setupBodyLabel()
    }
    
    private func setupTitleLabel() {
        addSubview(titleLabelView)
        titleLabelView.text = ""
        titleLabelView.translatesAutoresizingMaskIntoConstraints = false
        titleLabelView.textColor = .black
        titleLabelView.font = UIFont(name: "Avenir Next Bold", size: 24)
        titleLabelView.textAlignment = .left
        titleLabelView.numberOfLines = 0
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            titleLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setupBodyLabel() {
        addSubview(bodyLabelView)
        bodyLabelView.text = ""
        bodyLabelView.translatesAutoresizingMaskIntoConstraints = false
        bodyLabelView.textColor = .black
        bodyLabelView.font = UIFont(name: "Avenir Next Regular", size: 16)
        bodyLabelView.textAlignment = .left
        bodyLabelView.numberOfLines = 0
        NSLayoutConstraint.activate([
            bodyLabelView.topAnchor.constraint(equalTo: titleLabelView.bottomAnchor, constant: 16),
            bodyLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bodyLabelView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
}

extension PostFullView {
    
    func updateWith(title: String, body: String) {
        titleLabelView.text = title
        bodyLabelView.text = body
    }
    
}
