//
//  UtilsTests.swift
//  PrimeiroAppTestesUnitariosTests
//
//  Created by Enrico Sousa Gollner on 22/05/23.
//

import XCTest
@testable import PrimeiroAppTestesUnitarios

final class UtilsTests: XCTestCase {
    
    func testAverage() {
        let numbers = [1, 2, 3, 4, 5]
        let expected = 3
        let result = Utils.average(numbers: numbers)
        XCTAssertEqual(result, expected)
    }
    
    func testIsInt() {
        let txtTrue = "7"
        let resultTrue = Utils.isInt(s: txtTrue)
        let txtFalse = "7a"
        let resultFalse = Utils.isInt(s: txtFalse)
        
        
        
        XCTAssertTrue(resultTrue, "resultTrue deve ser verdadeiro, pois deve conseguir converter a String \(txtTrue) em Int")
        XCTAssertFalse(resultFalse, "resultFalse deve ser false, pois não deve conseguir converter a String \(txtFalse) em Int")
    }
    
    func testRandom() {
        let upperBound = 5
        let result = Utils.randomValue(upperBound: upperBound)
        
        XCTAssertTrue(result >= 0 && result <= upperBound, "O número gerado não deve ser menor que 0 ou maior que o upperBound.")
    }
    
    func testTrim() {
        let text = "   Swift's amazing   "
        let expected = "Swift's amazing"
        let result = Utils.trim(text)
        
        XCTAssertEqual(result, expected, "Os valores devem ser iguais, pois removemos os espaços iniciais e finais")
    }
    
}
