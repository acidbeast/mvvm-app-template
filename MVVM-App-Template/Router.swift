//
//  Router.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

protocol RouterProtocol: AnyObject {
    var navigationController: UINavigationController? { get set }
    var moduleBuilder: ModuleBuilderProtocol? { get set }
}

protocol MainRouterProtocol: RouterProtocol {
    func start()
    func goToRoot()
    func goBack()
}

class MainRouter: MainRouterProtocol {
    
    var navigationController: UINavigationController?
    var moduleBuilder: ModuleBuilderProtocol?
    
    init(
        navigationController: UINavigationController?,
        moduleBuilder: ModuleBuilderProtocol?
    ) {
        self.navigationController = navigationController
        self.moduleBuilder = moduleBuilder
    }
    
    func start() {
        guard let navigationController = navigationController else { return }
        guard let mainVC = moduleBuilder?.createMainModule(router: self) else { return }
        navigationController.viewControllers = [mainVC]
    }
    
    func goToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
    
    func goBack() {
        guard let navigationController = navigationController else { return }
        navigationController.popViewController(animated: true)
    }
    
}
