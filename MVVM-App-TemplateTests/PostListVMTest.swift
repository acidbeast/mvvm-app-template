//
//  PostListVMTest.swift
//  MVVM-App-TemplateTests
//
//  Created by Dmitry Shlepkin on 7/12/23.
//

import XCTest
@testable import MVVM_App_Template

final class PostListPostServiceMock: PostsServiceProtocol {
    
    var getPostsCallCounter = 0
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {
        getPostsCallCounter += 1
    }
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {}
    
}

final class PostListPostServiceErrorMock: PostsServiceProtocol {
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {
        enum TestError: Error {
            case error
        }
        let error: TestError = .error
        completion(nil, error)
    }
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {}
}

final class PostListPostServiceParseErrorMock: PostsServiceProtocol {
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {
        completion(nil, nil)
    }
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {}
}

final class PostListPostServiceEmptyMock: PostsServiceProtocol {
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {
        let data = PostList()
        completion(data, nil)
    }
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {}
}

final class PostListPostServiceSuccessMock: PostsServiceProtocol {
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {
        var data = PostList()
        let item = Post(userId: 1, id: 1, title: "", body: "")
        data.append(item)
        completion(data, nil)
    }
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {}
}


final class PostListVMTests: XCTestCase {

    var postViewDataMock: PostListViewData.Data!
    
    override func setUpWithError() throws {
        postViewDataMock = PostListViewData.Data(
            navigationTitle: "",
            title: "",
            description: "",
            posts: nil
        )
    }

    override func tearDownWithError() throws {
        postViewDataMock = nil
    }

    func testGetPostsServiceCall() throws {
        let postServiceMock = PostListPostServiceMock()
        let viewModel = PostListVM(postsService: postServiceMock)
        viewModel.getPosts()
        XCTAssert(postServiceMock.getPostsCallCounter == 1)
    }
    
    func testLoadingState() throws {
        let postServiceMock = PostListPostServiceMock()
        let viewModel = PostListVM(postsService: postServiceMock)
        viewModel.updateViewData = { viewData in
            XCTAssert(viewData == .loading(self.postViewDataMock))
        }
        viewModel.getPosts()
    }
    
    func testErrorState() throws {
        let postServiceMock = PostListPostServiceErrorMock()
        let viewModel = PostListVM(postsService: postServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.postViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .error(self.postViewDataMock))
            }
        }
        viewModel.getPosts()
    }
    
    func testParseErrorState() throws {
        let postServiceMock = PostListPostServiceParseErrorMock()
        let viewModel = PostListVM(postsService: postServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.postViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .error(self.postViewDataMock))
            }
        }
        viewModel.getPosts()
    }
    
    func testEmptyState() throws {
        let postServiceMock = PostListPostServiceEmptyMock()
        let viewModel = PostListVM(postsService: postServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.postViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .empty(self.postViewDataMock))
            }
        }
        viewModel.getPosts()
    }
        
    func testSuccessState() throws {
        let postServiceMock = PostListPostServiceSuccessMock()
        let viewModel = PostListVM(postsService: postServiceMock)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.postViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .success(self.postViewDataMock))
                XCTAssert(viewModel.posts.count == 1)
                XCTAssert(viewModel.cellsViewModels.count == 1)
            }
        }
        viewModel.getPosts()
    }
    
}
