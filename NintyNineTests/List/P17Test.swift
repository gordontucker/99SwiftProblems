//
//  P17Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/19/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P17Test: XCTestCase {

    func testSplit() {
        let split = List("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k").split(at: 3)
        
        XCTAssertEqualList(["a", "b", "c"], split.left)
        XCTAssertEqualList(["d", "e", "f", "g", "h", "i", "j", "k"], split.right)
    }
    
    func testSplit_outOfBoundsRight() {
        let split = List("a", "b", "c").split(at: 6)
        
        XCTAssertNil(split.right)
        XCTAssertEqualList(["a", "b", "c"], split.left)
    }
    
    func testSplit_outOfBoundsLeft() {
        let split = List("a", "b", "c").split(at: 0)
        XCTAssertNil(split.left)
        XCTAssertEqualList(["a", "b", "c"], split.right)
        
        let split_negative = List("a", "b", "c").split(at: -5)
        XCTAssertNil(split_negative.left)
        XCTAssertEqualList(["a", "b", "c"], split_negative.right)
    }

}
