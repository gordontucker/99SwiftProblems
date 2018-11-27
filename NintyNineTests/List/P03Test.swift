//
//  P03Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/14/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P03Test: XCTestCase {
    
/*
    public subscript(index: Int) -> T? {
        guard index > 0 else {return value }
        return nextItem?[index - 1]
    }
    */

    func testSubscript() {
        XCTAssertEqual(1, List(1, 2, 3, 4, 5, 6)[0])
        XCTAssertEqual(3, List(1, 2, 3, 4, 5, 6)[2])
        XCTAssertEqual(6, List(1, 2, 3, 4, 5, 6)[5])
        XCTAssertEqual(1, List(1)[0])
        XCTAssertNil(List(1)[1])
        XCTAssertNil(List(1)[-1])
        XCTAssertNil(List(1, 2, 3, 4)[4])
    }
}
