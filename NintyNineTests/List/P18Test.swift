//
//  P18Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/19/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P18Test: XCTestCase {

    func testSlice() {
        XCTAssertEqualList(["d", "e", "f", "g"], List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").slice(from: 3, to: 7))
        XCTAssertEqualList(["c"], List("a", "b", "c", "d", "e").slice(from: 2, to: 3))
    }
    
    func testSlice_outOfBounds() {
        XCTAssertNil(List("a", "b", "c").slice(from: -1, to: 2))
        XCTAssertNil(List("a", "b", "c").slice(from: 4, to: 2))
        XCTAssertEqualList(["a", "b", "c"], List("a", "b", "c").slice(from: 0, to: 40))
        XCTAssertNil(List("a", "b", "c").slice(from: 0, to: -2))
        XCTAssertNil(List("a", "b", "c").slice(from: 1, to: -2))
        XCTAssertNil(List("a", "b", "c", "d", "e").slice(from: 2, to: 1))
        XCTAssertNil(List("a", "b", "c", "d", "e").slice(from: 2, to: 2))
    }
    
}
