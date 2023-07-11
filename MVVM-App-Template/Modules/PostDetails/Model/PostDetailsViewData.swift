//
//  PostDetailsViewData.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import Foundation

enum PostDetailsViewData {
    
    case initial
    case loading(Data)
    case empty(Data)
    case error(Data)
    case success(Data)
    
    struct Data {
        let title: String
        let description: String
        let post: Post?
        let comments: Comments?
    }
    
}
