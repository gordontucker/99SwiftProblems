//
//  P20Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P20Test: XCTestCase {

    func testRemoveAt() {
        let list = List("a", "b", "c")
        
        XCTAssertEqualList(["a", "b", "c"], list.removeAt(-1).rest)
        XCTAssertNil(list.removeAt(-1).removed)
        XCTAssertEqualList(["a", "b", "c"], list.removeAt(3).rest)
        XCTAssertNil(list.removeAt(3).removed)
        XCTAssertEqualList(["a", "b", "c"], list.removeAt(4).rest)
        XCTAssertNil(list.removeAt(4).removed)
        XCTAssertEqualList(["a", "b"], list.removeAt(2).rest)
        XCTAssertEqual("c", list.removeAt(2).removed)
        XCTAssertEqualList(["a", "c"], list.removeAt(1).rest)
        XCTAssertEqual("b", list.removeAt(1).removed)
        XCTAssertEqualList(["b", "c"], list.removeAt(0).rest)
        XCTAssertEqual("a", list.removeAt(0).removed)
        XCTAssertNil(List("a").removeAt(0).rest)
        XCTAssertEqual("a", List("a").removeAt(0).removed)
    }

}
