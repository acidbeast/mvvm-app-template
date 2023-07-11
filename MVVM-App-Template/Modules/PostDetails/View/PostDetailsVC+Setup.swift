//
//  PostDetailsVC+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

extension PostDetailsVC {
    
    func setup() {
        setupPostFullView()
    }
    
    func setup(navigationTitle: String) {
        setupPostFullView()
        setupNavigation(title: navigationTitle)
    }
    
    private func setupNavigation(title: String) {
        navigationItem.title = title
    }
    
    private func setupPostFullView() {
        view.addSubview(postDetailsView)
        postDetailsView.translatesAutoresizingMaskIntoConstraints = false
        postDetailsView.backgroundColor = .white
        NSLayoutConstraint.activate([
            postDetailsView.topAnchor.constraint(equalTo: view.topAnchor),
            postDetailsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postDetailsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
