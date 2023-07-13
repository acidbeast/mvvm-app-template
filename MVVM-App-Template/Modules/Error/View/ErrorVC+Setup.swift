//
//  ErrorVC+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

extension ErrorVC {
    
    func setup() {
        view.backgroundColor = .white
        navigationController?.isNavigationBarHidden = true
        setupErrorView()
    }
    
    private func setupErrorView() {
        view.addSubview(errorContainerView)
        errorContainerView.pinWithSafeArea(to: view)
    }
    
}
