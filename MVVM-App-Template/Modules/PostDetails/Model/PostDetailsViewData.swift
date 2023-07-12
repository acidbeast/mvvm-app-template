//
//  PostDetailsViewData.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/11/23.
//

import Foundation

enum PostDetailsViewData: Equatable {
    
    case initial
    case loading(Data)
    case error(Data)
    case success(Data)
    
    struct Data {
        let title: String
        let description: String
        let post: Post?
        let comments: Comments?
    }
    
    static func == (lhs: PostDetailsViewData, rhs: PostDetailsViewData) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.success, .success):
            return true
        case ( .error, .error):
            return true
        default:
            return false
        }
    }
    
}
