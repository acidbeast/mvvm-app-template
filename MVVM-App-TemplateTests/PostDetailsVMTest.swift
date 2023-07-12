//
//  PostDetailsVMTest.swift
//  MVVM-App-TemplateTests
//
//  Created by Dmitry Shlepkin on 7/12/23.
//

import XCTest
@testable import MVVM_App_Template

final class PostDetailsPostServiceMock: PostsServiceProtocol {
    
    var getPostCallCounter = 0
    var id = 0
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {}
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {
        getPostCallCounter += 1
        self.id = id
    }
    
}

final class PostDetailsPostServiceErrorMock: PostsServiceProtocol {

    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {}

    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {
        enum TestError: Error {
            case error
        }
        let error: TestError = .error
        completion(nil, error)
    }
}

final class PostDetailsPostServiceParseErrorMock: PostsServiceProtocol {

    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {}

    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {
        completion(nil, nil)
    }
}

final class PostDetailsPostServiceSuccessMock: PostsServiceProtocol {

    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {}

    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {
        let data = Post(userId: 1, id: 1, title: "", body: "")
        completion(data, nil)
    }
}


final class PostDetailsVMTests: XCTestCase {

    var postViewDataMock: PostDetailsViewData.Data!
    
    override func setUpWithError() throws {
        postViewDataMock = PostDetailsViewData.Data(
            title: "",
            description: "",
            post: nil,
            comments: nil
        )
    }

    override func tearDownWithError() throws {
        postViewDataMock = nil
    }

    func testGetPostServiceCall() throws {
        let postServiceMock = PostDetailsPostServiceMock()
        let viewModel = PostDetailsVM(postsService: postServiceMock, postId: 1)
        viewModel.getPost()
        XCTAssert(postServiceMock.getPostCallCounter == 1)
        XCTAssert(postServiceMock.id == 1)
    }
    
    func testLoadingState() throws {
        let postServiceMock = PostDetailsPostServiceMock()
        let viewModel = PostDetailsVM(postsService: postServiceMock, postId: 1)
        viewModel.updateViewData = { viewData in
            XCTAssert(viewData == .loading(self.postViewDataMock))
        }
        viewModel.getPost()
    }

    func testErrorState() throws {
        let postServiceMock = PostDetailsPostServiceErrorMock()
        let viewModel = PostDetailsVM(postsService: postServiceMock, postId: 1)
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
        viewModel.getPost()
    }

    func testParseErrorState() throws {
        let postServiceMock = PostDetailsPostServiceParseErrorMock()
        let viewModel = PostDetailsVM(postsService: postServiceMock, postId: 1)
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
        viewModel.getPost()
    }
    
    func testSuccessState() throws {
        let postServiceMock = PostDetailsPostServiceSuccessMock()
        let viewModel = PostDetailsVM(postsService: postServiceMock, postId: 1)
        var updateViewDataCounter = 0
        viewModel.updateViewData = { viewData in
            updateViewDataCounter += 1
            if updateViewDataCounter == 1 {
                XCTAssert(viewData == .loading(self.postViewDataMock))
            }
            if updateViewDataCounter == 2 {
                XCTAssert(viewData == .success(self.postViewDataMock))
            }
        }
        viewModel.getPost()
    }
    
}

