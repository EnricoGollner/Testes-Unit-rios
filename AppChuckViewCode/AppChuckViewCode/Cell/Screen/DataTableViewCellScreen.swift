//
//  DataTableViewCellScreen.swift
//  AppChuckViewCode
//
//  Created by Enrico Sousa Gollner on 23/05/23.
//

import UIKit

class DataTableViewCellScreen: UIView {
    
    lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(dataLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            dataLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            dataLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            dataLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }

}
