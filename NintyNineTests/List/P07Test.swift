//
//  P08Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P07Test: XCTestCase {

    func testFlattening() {
        let expanded: List<Any> = List(List<Any>(1, 2), List<Any>(1, "string", 4), List<Any>(6, 8), 9, 10)
        let flattened = expanded.flattened
        XCTAssertEqual(9, flattened.count)
        XCTAssertEqual(1, flattened[0] as? Int)
        XCTAssertEqual(2, flattened[1] as? Int)
        XCTAssertEqual(1, flattened[2] as? Int)
        XCTAssertEqual("string", flattened[3] as? String)
        XCTAssertEqual(4, flattened[4] as? Int)
        XCTAssertEqual(6, flattened[5] as? Int)
        XCTAssertEqual(8, flattened[6] as? Int)
        XCTAssertEqual(9, flattened[7] as? Int)
        XCTAssertEqual(10, flattened[8] as? Int)
    }
}
