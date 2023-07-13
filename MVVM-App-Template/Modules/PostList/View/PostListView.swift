//
//  PostView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit

final class PostListView: UIView {
    
    var viewData: PostListViewData = .initial {
        didSet {
            setNeedsLayout()
        }
    }
    var onSelect: ((Int) -> Void)?
    var cellsViewModels = PostListCellVMs()
    
    lazy var loadingView = LoadingView()
    lazy var emptyView = EmptyView()
    lazy var errorView = ErrorView()
    lazy var tableView = UITableView()
    
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
            setupLoadingView()
            loadingView.playAnimation()
            break
        case .empty(let empty):
            setupEmptyView()
            emptyView.updateWith(title: empty.title, description: empty.description)
            break
        case .error(let error):
            setupErrorView()
            errorView.updateWith (title: error.title) {
                print("Action")
            }
            break
        case .success(let success):
            cellsViewModels = success.posts ?? []
            setupTableView()
            break
        }
    }
        
}
