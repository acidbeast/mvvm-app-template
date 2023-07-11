//
//  PostListView+Create.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit

extension PostListView {
    
    func createTestView1() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .red
        return view
    }
     
    func createTestView2() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view.backgroundColor = .yellow
        return view
    }
    
    func createTableView() -> UITableView {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }
    
    func createLoadingView() -> LoadingView {
        return LoadingView()
    }
    
}
