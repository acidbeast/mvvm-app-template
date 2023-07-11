//
//  PostsService.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

import Foundation

protocol PostsServiceProtocol {
    func getPosts(completion: @escaping (PostList?, Error?) -> Void)
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void)
}

class PostsService: PostsServiceProtocol {
    
    private func getData<T: Codable>(url: URL, completion: @escaping (T?, Error?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let data = try JSONDecoder().decode(T.self, from: data)
                completion(data, error)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
    func getPosts(completion: @escaping (PostList?, Error?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        getData(url: url, completion: completion)
    }
    
    func getPost(id: Int, completion: @escaping (Post?, Error?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/\(id)") else { return }
        getData(url: url, completion: completion)
    }
    
}
