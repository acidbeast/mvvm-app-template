//
//  MainVC+TableView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

import UIKit


extension PostsVC: UITableViewDelegate {}

extension PostsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellsViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellVM = viewModel.getPostCellVM(indexPath: indexPath)
        cell.textLabel?.text = cellVM.title
        return cell
    }
    
}
