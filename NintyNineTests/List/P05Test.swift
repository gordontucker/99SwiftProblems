//
//  P05Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/14/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P05Test: XCTestCase {

    func testReverse() {
        let reversed5 = List(1, 2, 3, 4, 5).reversed
        XCTAssertEqualList([5,4,3,2,1], reversed5)
        
        let reversed1 = List(1).reversed
        XCTAssertEqualList([1], reversed1)
        
        let reversed2 = List(1, 2).reversed
        XCTAssertEqualList([2, 1], reversed2)
    }
}
