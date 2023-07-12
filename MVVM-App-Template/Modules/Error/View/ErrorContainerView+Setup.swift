//
//  ErrorContainerView+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

extension ErrorContainerView {
    
    func setupErrorView() {
        errorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            errorView.topAnchor.constraint(equalTo: topAnchor),
            errorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            errorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            errorView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
}
