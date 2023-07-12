//
//  PostListViewData.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

import Foundation

enum PostListViewData: Equatable {

    
    
    case initial
    case loading(Data)
    case empty(Data)
    case success(Data)
    case error(Data)
    
    struct Data {
        let title: String
        let description: String
        let posts: PostListCellVMs?
    }
    
    static func == (lhs: PostListViewData, rhs: PostListViewData) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return true
        case (.loading, .loading):
            return true
        case (.empty, .empty):
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
 
