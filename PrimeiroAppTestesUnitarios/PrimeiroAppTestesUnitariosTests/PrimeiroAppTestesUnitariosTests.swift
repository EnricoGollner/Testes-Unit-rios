//
//  PrimeiroAppTestesUnitariosTests.swift
//  PrimeiroAppTestesUnitariosTests
//
//  Created by Enrico Sousa Gollner on 21/05/23.
//

import XCTest
@testable import PrimeiroAppTestesUnitarios

final class PrimeiroAppTestesUnitariosTests: XCTestCase {
    
    var vc: ViewController!

    override func setUpWithError() throws {  // Lifecycle Executado primeiro
        vc = ViewController()
    }

    override func tearDownWithError() throws {
        vc = nil
    }

    func testPrimeiraFuncao() throws {
        let valorTotal = 10 + 10
        XCTAssertEqual(20, valorTotal)
    }
    
}
