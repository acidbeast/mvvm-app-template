//
//  ModuleBuilder.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createMainModule(router: MainRouterProtocol) -> UIViewController
    func createErrorModule(router: MainRouterProtocol, title: String, description: String, action: (() -> Void)?) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createMainModule(router: MainRouterProtocol) -> UIViewController {
        let vm = MainVM()
        let vc = MainVC(
            router: router,
            viewModel: vm
        )
        return vc
    }
    
    func createErrorModule(router: MainRouterProtocol, title: String, description: String, action: (() -> Void)? = nil) -> UIViewController {
        let vm = ErrorVM(
            title: title,
            description: description
        )
        let vc = ErrorVC()
        vc.action = action
        vc.viewModel = vm
        vc.router = router
        return vc
    }
    
}
