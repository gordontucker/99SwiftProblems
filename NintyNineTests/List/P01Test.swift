//
//  P01Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/14/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P01Test: XCTestCase {

    func testLast() {
        XCTAssertEqual(5, List(1, 2, 3, 4, 5).last)
        XCTAssertEqual(1, List(1).last)
        XCTAssertEqual(5, List(1, 1, 1, 5, 1, 5).last)
    }
}
