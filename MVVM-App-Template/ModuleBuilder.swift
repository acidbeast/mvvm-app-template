//
//  ModuleBuilder.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import UIKit

protocol ModuleBuilderProtocol {
    func createPostListModule(router: MainRouterProtocol) -> UIViewController
    func createPostDetailsModule(router: MainRouterProtocol, postId: Int) -> UIViewController
    func createErrorModule(router: MainRouterProtocol, title: String, description: String, action: (() -> Void)?) -> UIViewController
}

final class ModuleBuilder: ModuleBuilderProtocol {
    
    func createPostListModule(router: MainRouterProtocol) -> UIViewController {
        let postService = PostsService()
        let vm = PostListVM(postsService: postService)
        let vc = PostListVC(
            router: router,
            viewModel: vm
        )
        return vc
    }
    
    func createPostDetailsModule(router: MainRouterProtocol, postId: Int) -> UIViewController {
        let postService = PostsService()
        let vm = PostDetailsVM(
            postsService: postService,
            postId: postId
        )
        let vc = PostDetailsVC(
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
        let vc = ErrorVC(
            router: router,
            viewModel: vm,
            action: action
        )
        return vc
    }
    
}
