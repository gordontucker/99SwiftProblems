//
//  P04Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/14/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P04Test: XCTestCase {

    func testCount() {
        XCTAssertEqual(1, List(1).count)
        XCTAssertEqual(5, List(1, 2, 3, 4, 5).count)
    }

}
