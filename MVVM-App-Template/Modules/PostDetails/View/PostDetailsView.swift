//
//  PostDetailsView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit

final class PostDetailsView: UIView {
    
    var viewData: PostDetailsViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    lazy var postFullView = createPostFullView()
    lazy var loadingView = createLoadingView()
    lazy var errorView = createErrorView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update(viewData: viewData)
    }
    
    private func update(viewData: PostDetailsViewData) {
        subviews.forEach { $0.removeFromSuperview() }
        switch viewData {
        case .initial:
            break
        case .loading:
            addSubview(loadingView)
            setupLoadingView()
            loadingView.playAnimation()
            break
        case .error(let error):
            addSubview(errorView)
            setupErrorView()
            errorView.updateWith (title: error.title) {
                print("Action")
            }
            break
        case .success(let success):
            addSubview(postFullView)
            setupPostFullView()
            postFullView.updateWith(
                title: success.post?.title ?? "",
                body: success.post?.body ?? ""
            )
            break
        }
    }
    
}
