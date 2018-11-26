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
}
