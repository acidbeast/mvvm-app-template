//
//  PostsVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

final class PostsVC: UIViewController {
    
    var tableView: UITableView!
    var viewModel: PostsVMProtocol
    var router: MainRouterProtocol
    
    init(
        router: MainRouterProtocol,
        viewModel: PostsVMProtocol
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
        setup()
        viewModel.getPosts()
        viewModel.reloadTableView = {
            DispatchQueue.main.async { [weak self] in
                print("Done!")
                self?.tableView.reloadData()
            }
        }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            self.router.showError(title: "Error", description: "Please, try later.", action: nil)
//        }
    }
    
    
    

}
