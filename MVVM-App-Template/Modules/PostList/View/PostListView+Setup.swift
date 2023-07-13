//
//  PostListView+Setup.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit


extension PostListView {
    
    func setup() {
        backgroundColor = .white
    }
            
    func setupTableView() {
        addSubview(tableView)
        tableView.pin(to: self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupLoadingView() {
        addSubview(loadingView)
        loadingView.pin(to: self)
    }
    
    func setupEmptyView() {
        addSubview(emptyView)
        emptyView.pin(to: self)
    }
    
    func setupErrorView() {
        addSubview(errorView)
        errorView.pin(to: self)
    }
    
}
