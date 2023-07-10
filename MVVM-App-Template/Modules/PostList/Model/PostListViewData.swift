//
//  PostListViewData.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

import Foundation

enum PostListViewData {
    
    case initial
    case loading(Data)
    case empty(Data)
    case success(Data)
    case error(Data)
    
    struct Data {
        let navigationTitle: String
        let title: String
        let description: String
        let posts: PostListCellVMs?
    }
    
}
 
