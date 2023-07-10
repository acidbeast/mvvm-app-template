//
//  ModuleBuilder.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createPostsModule(router: MainRouterProtocol) -> UIViewController
    func createErrorModule(router: MainRouterProtocol, title: String, description: String, action: (() -> Void)?) -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    
    func createPostsModule(router: MainRouterProtocol) -> UIViewController {
        let postService = PostsService()
        let vm = PostListVM(postsService: postService)
        let vc = PostListVC(
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
