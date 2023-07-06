//
//  MainVC.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

class MainVC: UIViewController {
    
    weak var viewModel: MainVMProtocol?
    weak var router: MainRouterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
    

}
