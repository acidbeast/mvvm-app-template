//
//  MainVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

class MainVC: UIViewController {
    
    var viewModel: MainVMProtocol
    var router: MainRouterProtocol
    
    init(
        router: MainRouterProtocol,
        viewModel: MainVMProtocol
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
        self.view.backgroundColor = .red
        print("111")
        print(self.router)
        print(self.viewModel)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.router.showError(title: "Error", description: "Please, try later.", action: nil)
        }
    }
    

}
