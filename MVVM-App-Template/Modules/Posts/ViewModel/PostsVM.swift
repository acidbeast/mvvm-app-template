//
//  PostsVM.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/5/23.
//

import Foundation

protocol PostsVMProtocol: AnyObject {
    var reloadTableView: (() -> Void)? { get set }
    var cellsViewModels: [PostsCellVM] { get }
    func getPosts()
    func getPostCellVM(indexPath: IndexPath) -> PostsCellVM
}

final class PostsVM: PostsVMProtocol {
    
    private var postsService: PostsServiceProtocol
    
    var posts = Posts()
    
    public var reloadTableView: (() -> Void)?
    public var cellsViewModels = [PostsCellVM]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init(postsService: PostsServiceProtocol) {
        self.postsService = postsService
    }
    
    func getPosts() {
        postsService.getPosts { [weak self] posts, error in
            guard let posts = posts else { return }
            self?.fetchData(posts: posts)
        }
    }
        
    func fetchData(posts: Posts) {
        self.posts = posts
        var cellsVM = [PostsCellVM]()
        for post in posts {
            cellsVM.append(createCellViewModel(post: post))
        }
        cellsViewModels = cellsVM
    }
    
    func createCellViewModel(post: Post) -> PostsCellVM {
        let id = post.id
        let userId = post.userId
        let title = post.title
        return PostsCellVM(id: id, userId: userId, title: title)
    }
    
    func getPostCellVM(indexPath: IndexPath) -> PostsCellVM {
        return cellsViewModels[indexPath.row]
    }
    
}
