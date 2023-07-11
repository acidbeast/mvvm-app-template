//
//  PostView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit

class PostListView: UIView {
    
    var viewData: PostListViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    
    var cellsViewModels = PostListCellVMs()
    
    lazy var loadingView = createLoadingView()
    lazy var emptyView = createEmptyView()
    lazy var errorView = createErrorView()
    lazy var tableView = createTableView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        update(viewData: viewData)
    }
    
    private func update(viewData: PostListViewData) {
        subviews.forEach { $0.removeFromSuperview() }
        switch viewData {
        case .initial:
            break
        case .loading:
            addSubview(loadingView)
            setupLoadingView()
            loadingView.playAnimation()
            break
        case .empty(let empty):
            addSubview(emptyView)
            setupEmptyView()
            emptyView.updateWith(title: empty.title, description: empty.description)
            break
        case .error(let error):
            addSubview(errorView)
            setupErrorView()
            errorView.updateWith (title: error.title) {
                print("Action")
            }
            break
        case .success(let success):
            cellsViewModels = success.posts ?? []
            addSubview(tableView)
            setupTableView()
            break
        }
    }
        
}
