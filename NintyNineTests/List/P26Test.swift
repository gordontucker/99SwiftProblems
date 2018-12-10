//
//  P26Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P26Test: XCTestCase {

    func testCombinations() {
        let combos = List("a", "b", "c").combinations(group: 2)
        XCTAssertEqual(3, combos?.count)
        guard combos?.count == 3 else { return }
        
        XCTAssertEqualList(["a", "b"], combos?[0])
        XCTAssertEqualList(["a", "c"], combos?[1])
        XCTAssertEqualList(["b", "c"], combos?[2])
    }

    func testCombinations_large() {
        let combos = List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l").combinations(group: 3)
        XCTAssertEqual(220, combos?.count)
        combos?.forEach {
            print("Committee: \($0.description)")
            XCTAssertEqual(3, $0.count, "\($0.description) had the wrong number of items")
        }
    }
    
    func testPermutations() {
        let permutations = List("a", "b", "c", "d").permutations(3)
        
        XCTAssertEqual("{ { a, b, c }, { a, b, d }, { a, c, b }, { a, c, d }, { a, d, b }, { a, d, c }, { b, a, c }, { b, a, d }, { b, c, a }, { b, c, d }, { b, d, a }, { b, d, c }, { c, a, b }, { c, a, d }, { c, b, a }, { c, b, d }, { c, d, a }, { c, d, b }, { d, a, b }, { d, a, c }, { d, b, a }, { d, b, c }, { d, c, a }, { d, c, b } }", "\(permutations!)")
    }
}
