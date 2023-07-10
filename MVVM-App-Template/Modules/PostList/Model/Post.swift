//
//  Post.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

typealias PostList = [Post]

struct Post: Codable {
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case userId
        case id
        case title
        case body
    }
    
}
