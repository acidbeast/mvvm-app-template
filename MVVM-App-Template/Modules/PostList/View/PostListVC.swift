//
//  PostListVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

final class PostListVC: UIViewController {
    
    var viewModel: PostListVMProtocol
    var router: MainRouterProtocol
    var postListView = PostListView()
    
    init(
        router: MainRouterProtocol,
        viewModel: PostListVMProtocol
    ) {
        self.router = router
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup(navigationTitle: "Posts")
        setUpdateViewHander()
        setViewOnSelectHandler()
        viewModel.getPosts()
        // Go to error screen
        /*
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.router.showError(title: "Error", description: "Please, try later.") { [weak self] in
                self?.navigationController?.isNavigationBarHidden = false
                self?.router.goBack()
            }
        }
        */
    }
    
    private func setUpdateViewHander() {
        viewModel.updateViewData = { viewData in
            DispatchQueue.main.async { [weak self, viewData] in
                self?.postListView.viewData = viewData
            }
        }
    }
    
    private func setViewOnSelectHandler() {
        postListView.onSelect = { [weak self] postId in
            self?.router.showPostDetails(postId: postId)
        }
    }
    
}
