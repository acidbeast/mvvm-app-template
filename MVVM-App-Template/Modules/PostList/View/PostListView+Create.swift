//
//  PostListView+Create.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit

extension PostListView {
        
    func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }
    
    func createLoadingView() -> LoadingView {
        return LoadingView()
    }
    
    func createEmptyView() -> EmptyView {
        return EmptyView()
    }
    
}
