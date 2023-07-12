//
//  PostDetailsView+Create.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit


extension PostDetailsView {
        
    func createPostFullView() -> PostFullView {
        return PostFullView()
    }
    
    func createLoadingView() -> LoadingView {
        return LoadingView()
    }
    
    func createErrorView() -> ErrorView {
        return ErrorView()
    }
    
}
