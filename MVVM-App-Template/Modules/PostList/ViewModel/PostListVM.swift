//
//  PostsVM.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import Foundation

protocol PostListVMProtocol: AnyObject {
    var updateViewData: ((PostListViewData) -> Void)? { get set }
    var cellsViewModels: PostListCellVMs { get }
    func getPosts()
}

final class PostListVM: PostListVMProtocol {
    
    
    private var postsService: PostsServiceProtocol
    
    var posts = PostList()
    
    public var updateViewData: ((PostListViewData) -> Void)?
    public var cellsViewModels = PostListCellVMs()
    
    init(postsService: PostsServiceProtocol) {
        self.postsService = postsService
        updateViewData?(.initial)
    }
    
    func getPosts() {
        updateViewData?(.loading(PostListViewData.Data(
            navigationTitle: "Posts",
            title: "Loading",
            description: "Please wait.",
            posts: nil
        )))
        postsService.getPosts { [weak self] posts, error in
            if (error) != nil {
                self?.updateViewData?(.error(PostListViewData.Data(
                    navigationTitle: "Posts",
                    title: "Error",
                    description: "Please try again.",
                    posts: nil
                )))
                return
            }
            guard let posts = posts else { return }
            if posts.count == 0 {
                self?.updateViewData?(.empty(PostListViewData.Data(
                    navigationTitle: "Posts",
                    title: "Empty",
                    description: "Post list is empty.",
                    posts: self?.cellsViewModels
                )))
            }
            self?.posts = posts
            self?.createCellsViewModels(posts: posts)
            // Delay to show loading screen in case of fast network response
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                self?.updateViewData?(.success(PostListViewData.Data(
                    navigationTitle: "Posts",
                    title: "",
                    description: "",
                    posts: self?.cellsViewModels
                )))
            }
        }
    }
        
    private func createCellsViewModels(posts: PostList) {
        var cellsVM = PostListCellVMs()
        for post in posts {
            cellsVM.append(createCellViewModelFrom(post: post))
        }
        cellsViewModels = cellsVM
    }
    
    private func createCellViewModelFrom(post: Post) -> PostListCellVM {
        let id = post.id
        let userId = post.userId
        let title = post.title
        return PostListCellVM(id: id, userId: userId, title: title)
    }

}
