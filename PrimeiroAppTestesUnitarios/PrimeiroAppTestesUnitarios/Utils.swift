//
//  Utils.swift
//  PrimeiroAppTestesUnitarios
//
//  Created by Enrico Sousa Gollner on 22/05/23.
//

import Foundation

class Utils {
    
    static func average(numbers: [Int]) -> Int {
//        var total = 0
//        for num in numbers {
//            total += num
//        }
//        total /= numbers.count
//        return total
        
        return numbers.reduce(0, +) / numbers.count
    }
    
    static func isInt(s: String) -> Bool {
        return Int(s) != nil
    }
    
    static func randomValue(upperBound: Int) -> Int {
        return Int.random(in: 0...upperBound)
    }
    
    static func trim(_ txt: String) -> String {
        return txt.trimmingCharacters(in: .whitespaces)
    }
    
}
