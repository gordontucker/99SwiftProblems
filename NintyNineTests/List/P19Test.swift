//
//  P19Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/19/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P19Test: XCTestCase {
    func testRotateLeft() {
        XCTAssertEqualList(["d", "e", "f", "g", "h", "i", "j", "k", "a", "b", "c"], List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(3))
        
        XCTAssertEqualList(["j", "k", "a", "b", "c", "d", "e", "f", "g", "h", "i"], List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").rotate(-2))
        
        XCTAssertEqualList(["a", "b", "c"], List("a", "b", "c").rotate(0))
        XCTAssertEqualList(["b", "c", "a"], List("a", "b", "c").rotate(4))
    }
}
