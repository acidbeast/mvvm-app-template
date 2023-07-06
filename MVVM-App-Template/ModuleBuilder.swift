//
//  ModuleBuilder.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMainModule(router: MainRouterProtocol) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createMainModule(router: MainRouterProtocol) -> UIViewController {
        let vm = MainVM()
        let vc = MainVC()
        vc.viewModel = vm
        vc.router = router
        return vc
    }
    
}
