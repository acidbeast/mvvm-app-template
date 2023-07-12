//
//  PostDetailsView+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

extension PostDetailsView {
        
    func setupPostFullView() {
        postFullView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postFullView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            postFullView.leadingAnchor.constraint(equalTo: leadingAnchor),
            postFullView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func setupLoadingView() {
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
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
