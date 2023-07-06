//
//  Router.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

protocol RouterProtocol {
    var navigationController: UINavigationController? { get set }
}

protocol MainRouterProtocol: RouterProtocol {
    func showMain()
    func goToRoot()
    func goBack()
}

class MainRouter: MainRouterProtocol {
    
    var navigationController: UINavigationController?
    
    init (
        navigationController: UINavigationController?
    ) {
        self.navigationController = navigationController
    }
    
    func showMain() {
        
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
