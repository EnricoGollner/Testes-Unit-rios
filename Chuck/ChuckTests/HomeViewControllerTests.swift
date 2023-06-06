//
//  HomeViewControllerTests.swift
//  ChuckTests
//
//  Created by Enrico Sousa Gollner on 26/05/23.
//

import XCTest
@testable import Chuck

final class HomeViewControllerTests: XCTestCase {
    
    var viewController: HomeViewController!
    var tableView: UITableView!
    var tableViewMock: TableViewMock!

    override func setUpWithError() throws {
        tableViewMock = TableViewMock()
        viewController = HomeViewController()
        tableView = UITableView()
        viewController.tableView = tableView  // Agora não haverá um crash, pois temos uma instância de tableView, o elemento tem vida
        viewController.configTableView()
    }

    override func tearDownWithError() throws {
        viewController = nil
        tableView = nil
        tableViewMock = nil
    }

    func testConfigTableView() throws {
        // Verificando se foi configurado, que conterá a classe assinando as propriedades:
        XCTAssertTrue(viewController.tableView.delegate is HomeViewController)
        XCTAssertTrue(viewController.tableView.dataSource is HomeViewController)
    }
    
    func testNumberOfRowsInSection() {
        tableViewMock.dataSource = viewController
        XCTAssertEqual(tableViewMock.numberOfRowsInSectionCallCount, 0)
        _ = tableViewMock.numberOfRows(inSection: 0)  // executando
        XCTAssertEqual(tableViewMock.numberOfRowsInSectionCallCount, 1)  // verificando se foi realmente executado.
    }
    
    func testCellForRowAtIndexPath() {
        tableViewMock.dataSource = viewController
        XCTAssertEqual(tableViewMock.cellForRowAtIndexPathCallCount, 0)
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))  // executando
        XCTAssertEqual(tableViewMock.cellForRowAtIndexPathCallCount, 1)  // verificando se foi realmente executado.
    }

}

class TableViewMock: UITableView {
    var numberOfRowsInSectionCallCount = 0
    var cellForRowAtIndexPathCallCount = 0
    
    // Verificando se o método foi realmente chamado:
    
    override func numberOfRows(inSection section: Int) -> Int {
        numberOfRowsInSectionCallCount += 1  // indicativo de que o método foi realmente executado
        return super.numberOfRows(inSection: section)
    }
    
    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        cellForRowAtIndexPathCallCount += 1  // indicativo de que o método foi realmente executado
        return super.cellForRow(at: indexPath)
    }
}
