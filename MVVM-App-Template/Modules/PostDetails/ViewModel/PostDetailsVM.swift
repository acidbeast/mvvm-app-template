//
//  PostDetailsVM.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import Foundation

protocol PostDetailsVMProtocol {
    var updateViewData: ((PostDetailsViewData) -> Void)? { get set }
    func getPost()
}

final class PostDetailsVM: PostDetailsVMProtocol {
    
    private var postsService: PostsServiceProtocol
    private var postId: Int
    
    public var updateViewData: ((PostDetailsViewData) -> Void)?
        
    init(postsService: PostsServiceProtocol, postId: Int) {
        self.postsService = postsService
        self.postId = postId
        updateViewData?(.initial)
    }
    
}

extension PostDetailsVM {
    
    func getPost() {
        updateViewData?(.loading(PostDetailsViewData.Data(
            title: "Loading",
            description: "Please wait.",
            post: nil,
            comments: nil
        )))
        postsService.getPost(id: postId) { [weak self] post, error in
            if (error) != nil {
                self?.updateViewData?(.error(PostDetailsViewData.Data(
                    title: "Network Error",
                    description: "Try again",
                    post: nil,
                    comments: nil
                )))
                return
            }
            guard let post = post else {
                self?.updateViewData?(.error(PostDetailsViewData.Data(
                    title: "Parse Error",
                    description: "Try again",
                    post: nil,
                    comments: nil
                )))
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.updateViewData?(.success(PostDetailsViewData.Data(
                    title: "",
                    description: "",
                    post: post,
                    comments: nil
                )))
            }
        }
    }
    
}
