//
//  PostDetailsVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import UIKit


final class PostDetailsVC: UIViewController {
    
    var viewModel: PostDetailsVMProtocol
    var router: MainRouterProtocol
    var postDetailsView = PostDetailsView()
    
    init(
        router: MainRouterProtocol,
        viewModel: PostDetailsVMProtocol
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
        setup(navigationTitle: "Details")
        setUpdateViewHander()
        viewModel.getPost()
    }
    
}


extension PostDetailsVC {
    
    private func setUpdateViewHander() {
        viewModel.updateViewData = { viewData in
            DispatchQueue.main.async { [weak self, viewData] in
                self?.postDetailsView.viewData = viewData
            }
        }
    }
    
}
