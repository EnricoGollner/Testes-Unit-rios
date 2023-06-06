//
//  ViewModelTests.swift
//  ChuckTests
//
//  Created by Enrico Sousa Gollner on 26/05/23.
//

import XCTest
@testable import Chuck

final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockService: MockHomeService!
    var mockDelegate: MockHomeViewModelDelegate!

    override func setUpWithError() throws {
        mockService = MockHomeService()
        viewModel = HomeViewModel(service: mockService)
        mockDelegate = MockHomeViewModelDelegate()
        viewModel.delegate(delegate: mockDelegate)
    }

    override func tearDownWithError() throws {
        mockService = nil
        viewModel = nil
        mockDelegate = nil
    }

    func testFetchRequestSuccess() throws {
        let list = ["category1", "category2"]
        mockService.result = .success(list)  // substituindo o conteúdo que iremos retornar direto quando chamarmos da func getHome:
        
        viewModel.fetchRequest()
        
        XCTAssertEqual(viewModel.numberOfRowsInSection, list.count)  // verificando se ambos tem o mesmo tamanho
        XCTAssertEqual(viewModel.loadCurrentCategory(indexPath: IndexPath(row: 0, section: 0)), list[0])  // verificando se ambos tem o mesmo valor armazenado
        // Validação para protocolo:
        XCTAssertTrue(mockDelegate.successCalled)
    }
    
    func testFetchRequestFailure() {
        mockService.result = .failure(NSError(domain: "com.test.error", code: 0))
        viewModel.fetchRequest()
        
        XCTAssertEqual(viewModel.numberOfRowsInSection, 0)
        XCTAssertTrue(mockDelegate.errorCalled)
    }

}

class MockHomeViewModelDelegate: HomeViewModelProtocol {
    
    var successCalled = false
    var errorCalled = false
    
    func error(message: String) {
        errorCalled = true
    }
    
    func success() {
        successCalled = true
    }
    
    
}

class MockHomeService: HomeServiceProtocol {  // Apenas para testes - não precisando refazer as requisições...
    var result: Result<[String], Error> = .success([])
    func getHome(completion: @escaping (Result<[String], Error>) -> Void) {
        completion(result)  // Nosso callback direto
    }
}
