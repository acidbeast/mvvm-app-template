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
        view.backgroundColor = .white
        postDetailsView.pinWithSafeArea(to: view)
    }
    
}
