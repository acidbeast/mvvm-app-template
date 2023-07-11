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
            break
        case .error(let error):
            break
        case .success(let success):
            cellsViewModels = success.posts ?? []
            addSubview(tableView)
            setupTableView()
            break
        }
    }
        
}
