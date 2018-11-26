//
//  P02Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/14/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P02Test: XCTestCase {

    func testPennultimate() {
        XCTAssertEqual(4, List(1, 2, 3, 4, 5).pennultimate)
        XCTAssertEqual(1, List(1, 2).pennultimate)
        XCTAssertNil(List(1).pennultimate)
    }

}
