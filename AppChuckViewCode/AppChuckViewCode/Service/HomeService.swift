//
//  HomeService.swift
//  AppChuckViewCode
//
//  Created by Enrico Sousa Gollner on 23/05/23.
//

import Alamofire
import UIKit

protocol HomeServiceProtocol: AnyObject {
    func getHome(completion: @escaping (Result<[String], Error>) -> Void)
}

class HomeService: HomeServiceProtocol {
    
    func getHome(completion: @escaping (Result<[String], Error>) -> Void) {
        let url: String = "https://api.chucknorris.io/jokes/categories"
        
        AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: [String].self) { response in
            print(#function)
            debugPrint(response)
            
            switch response.result {
            case .success(let success):
                completion(.success(success))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
