//
//  HomeScreen.swift
//  AppChuckViewCode
//
//  Created by Enrico Sousa Gollner on 23/05/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var dataTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DataTableViewCell.self, forCellReuseIdentifier: DataTableViewCell.identifier)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    public func configTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.dataTableView.delegate = delegate
        self.dataTableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        configConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(dataTableView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            dataTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            dataTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            dataTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            dataTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

}
