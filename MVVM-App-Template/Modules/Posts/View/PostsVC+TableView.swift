//
//  MainVC+TableView.swift
//  MVVM-App-Template
//
//  Created by Dmitry Shlepkin on 7/6/23.
//

import UIKit


extension PostsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("show details")
        //router.showError(title: "1", description: "2", action: nil)
    }
}

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
