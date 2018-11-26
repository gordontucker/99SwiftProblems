//
//  P09Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P08Test: XCTestCase {

    func testCompressed() {
        XCTAssertEqualList(["a", "b", "c", "d", "c", "e"], List("a", "a", "a", "b", "b", "c", "c", "d", "d", "d", "d", "c", "e", "e").compressed)
        XCTAssertEqualList(["a", "b"], List("a", "b", "b").compressed)
        XCTAssertEqualList(["a"], List("a").compressed)
    }
}
