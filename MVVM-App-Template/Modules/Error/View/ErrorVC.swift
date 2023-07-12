//
//  ErrorVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

final class ErrorVC: UIViewController {
        
    var viewModel: ErrorVMProtocol
    var router: MainRouterProtocol
    var errorContainerView: ErrorContainerView
    
    init(
        router: MainRouterProtocol,
        viewModel: ErrorVMProtocol,
        action: (()->Void)?
    ) {
        self.router = router
        self.viewModel = viewModel
        self.errorContainerView = ErrorContainerView(action: action)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setUpdateViewHander()
        viewModel.update()
    }
    
}

extension ErrorVC {
    
    private func setUpdateViewHander() {
        viewModel.updateViewData = { viewData in
            DispatchQueue.main.async { [weak self, viewData] in
                self?.errorContainerView.viewData = viewData
            }
        }
    }

}
