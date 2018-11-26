//
//  P22Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P22Test: XCTestCase {

    func testRange() {
        let list = List<Any>.range(from: 1, to: 0)
        XCTAssertNil(list)
        XCTAssertEqualList([1,2,3], List<Any>.range(from: 1, to: 3))
        XCTAssertEqualList([4,5,6,7,8,9], List<Any>.range(from: 4, to: 9))
        XCTAssertEqualList([1], List<Any>.range(from: 1, to: 1))
    }

}
