//
//  PostListVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

final class PostListVC: UIViewController {
    
    var tableView: UITableView!
    var viewModel: PostListVMProtocol
    var router: MainRouterProtocol
    var postsView = PostListView()
    
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
        //setup()
        setupPostsView()
        updateView()
        viewModel.getPosts()
//        viewModel.reloadTableView = {
//            DispatchQueue.main.async { [weak self] in
//                print("Done!")
//                self?.tableView.reloadData()
//            }
//        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.router.showError(title: "Error", description: "Please, try later.", action: nil)
//        }
    }
    
    private func setupPostsView() {
        view.addSubview(postsView)
        postsView.translatesAutoresizingMaskIntoConstraints = false
        postsView.backgroundColor = .white
        NSLayoutConstraint.activate([
            postsView.topAnchor.constraint(equalTo: view.topAnchor),
            postsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            postsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func updateView() {
        viewModel.updateViewData = { viewData in
            DispatchQueue.main.async { [weak self, viewData] in
                print("Done!")
                self?.postsView.viewData = viewData
            }
        }
    }
    

}
