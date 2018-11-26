//
//  P12Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P12Test: XCTestCase {

    func testDecode() {
        let list = List((4, "a"), (1, "b"), (2, "c"), (2, "a"), (1, "d"), (4, "e"))
        let decoded: List<String>? = list.decode()
        XCTAssertEqualList(["a", "a", "a", "a", "b", "c", "c", "a", "a", "d", "e", "e", "e", "e"], decoded)
    }

}
