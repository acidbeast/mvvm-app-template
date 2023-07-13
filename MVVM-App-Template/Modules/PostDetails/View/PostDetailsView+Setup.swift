//
//  PostDetailsView+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

extension PostDetailsView {
        
    func setupPostFullView() {
        addSubview(postFullView)
        postFullView.pin(to: self)
    }
    
    func setupLoadingView() {
        addSubview(loadingView)
        loadingView.pin(to: self)
    }
    
    func setupErrorView() {
        addSubview(errorView)
        errorView.pin(to: self)
    }
    
}
