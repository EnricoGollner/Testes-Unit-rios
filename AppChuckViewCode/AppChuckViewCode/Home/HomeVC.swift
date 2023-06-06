//
//  ViewController.swift
//  AppChuckViewCode
//
//  Created by Enrico Sousa Gollner on 23/05/23.
//

import UIKit

class HomeVC: UIViewController {
    
    private var screen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel(service: HomeService())
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest()
    }

}

extension HomeVC: HomeViewModelProtocol {
    func success() {
        self.screen?.configTableView(delegate: self, dataSource: self)
        self.screen?.dataTableView.reloadData()
    }
    
    func error(message: String) {
        print("Erro: \(message)")
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DataTableViewCell.identifier) as? DataTableViewCell
        cell?.setUpCell(data: viewModel.loadCurrentData(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return viewModel.heightForRow
    }
    
}
