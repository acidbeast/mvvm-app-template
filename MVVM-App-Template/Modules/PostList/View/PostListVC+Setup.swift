//
//  PostListVC+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

extension PostListVC {
    
    func setup() {
        setupPostsView()
    }
    
    func setup(navigationTitle: String) {
        setupPostsView()
        setupNavigation(title: navigationTitle)
    }
    
    private func setupNavigation(title: String) {
        navigationItem.title = title
    }
    
    private func setupPostsView() {
        view.addSubview(postListView)
        postListView.translatesAutoresizingMaskIntoConstraints = false
        postListView.backgroundColor = .white
        NSLayoutConstraint.activate([
            postListView.topAnchor.constraint(equalTo: view.topAnchor),
            postListView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postListView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
}
