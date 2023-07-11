//
//  Comment.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

typealias Comments = [Comment]

struct Comment: Codable {
    
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
    
    enum CodingKeys: String, CodingKey {
        case postId
        case id
        case name
        case email
        case body
    }
    
}
