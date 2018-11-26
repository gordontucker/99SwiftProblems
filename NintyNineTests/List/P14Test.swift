//
//  P14Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P14Test: XCTestCase {

    func testDuplicate() {
        let list = List("a", "b", "c", "c", "d")
        XCTAssertEqualList(["a", "b", "c", "c", "d"], list.duplicate(1))
        XCTAssertEqualList(["a", "a", "b", "b", "c", "c", "c", "c", "d", "d"], list.duplicate(2))
        XCTAssertEqualList(["a", "a", "a", "b", "b", "b", "c", "c", "c", "c", "c", "c", "d", "d", "d"], list.duplicate(3))
    }
}
