//
//  P09Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P09Test: XCTestCase {

    func testPacked() {
        let packed = List(1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5).packed
        print("packed: \(packed)")
        XCTAssertEqual(6, packed.count)
        guard packed.count == 6 else { return }
        XCTAssertEqualList([1, 1, 1, 1], packed[0])
        XCTAssertEqualList([2], packed[1])
        XCTAssertEqualList([3, 3], packed[2])
        XCTAssertEqualList([1, 1], packed[3])
        XCTAssertEqualList([4], packed[4])
        XCTAssertEqualList([5, 5, 5, 5], packed[5])
    }
}
