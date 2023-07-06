//
//  PostsService.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

import Foundation

protocol PostsServiceProtocol {
    func getPosts(completion: @escaping (Posts?, Error?) -> Void)
}

class PostsService: PostsServiceProtocol {
    
    func getPosts(completion: @escaping (Posts?, Error?) -> Void) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            do {
                let posts = try JSONDecoder().decode(Posts.self, from: data)
                completion(posts, error)
            } catch {
                completion(nil, error)
            }
        }
        task.resume()
    }
    
}
