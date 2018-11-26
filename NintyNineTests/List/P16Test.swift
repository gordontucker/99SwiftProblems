//
//  P16Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P16Test: XCTestCase {

    func testDrop() {
        let list = List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k")
        XCTAssertEqualList(["a", "b", "d", "e", "g", "h", "j", "k"], list.drop(every: 3))
        XCTAssertNil(List("a", "b", "c").drop(every: 1))
    }
}
