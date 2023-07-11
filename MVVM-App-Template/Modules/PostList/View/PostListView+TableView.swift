//
//  PostListView+TableView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/10/23.
//

import UIKit
    
extension PostListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellVM = cellsViewModels[indexPath.row]
        if let onSelect = onSelect {
            onSelect(cellVM.id)
        }
    }
}

extension PostListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellVM = cellsViewModels[indexPath.row]
        cell.textLabel?.text = cellVM.title
        return cell
    }
    
}
