//
//  HomeViewModel.swift
//  AppChuckViewCode
//
//  Created by Enrico Sousa Gollner on 23/05/23.
//

import UIKit

protocol HomeViewModelProtocol: AnyObject {
    func success()
    func error(message: String)
}

class HomeViewModel {
    
    private var categoryList = [String]()
    private weak var delegate: HomeViewModelProtocol?
    private var service: HomeServiceProtocol
    
    init(service: HomeServiceProtocol) {
        self.service = service
    }
    
    public func delegate(delegate: HomeViewModelProtocol?) {
        self.delegate = delegate
    }
    
    public func fetchRequest() {
        service.getHome { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let success):
                self.categoryList = success
                self.delegate?.success()
            case .failure(let failure):
                self.delegate?.error(message: failure.localizedDescription)
                print("Erro ao aprensentar os dados: \(failure.localizedDescription)")
            }
        }
    }
    
    public var numberOfRowsInSection: Int {
        return categoryList.count
    }
    
    public func loadCurrentData(indexPath: IndexPath) -> String {
        return categoryList[indexPath.row]
    }
    
    public var heightForRow: CGFloat {
        return 50
    }
    
}
