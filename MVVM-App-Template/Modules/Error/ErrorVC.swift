//
//  ErrorVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

class ErrorVC: UIViewController {
    
    weak var viewModel: ErrorVMProtocol?
    weak var router: MainRouterProtocol?
    var action: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
    }
    
}
