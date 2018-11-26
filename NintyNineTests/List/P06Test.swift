//
//  P07Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P06Test: XCTestCase {

    func testPalindrome() {
        XCTAssertTrue(List(1).isPalindrome)
        XCTAssertTrue(List(1,1).isPalindrome)
        XCTAssertTrue(List(1, 2, 1).isPalindrome)
        XCTAssertTrue(List(2, 1, 2, 1, 2).isPalindrome)
        XCTAssertTrue(List(2, 1, 1, 2).isPalindrome)
        XCTAssertFalse(List(1, 2).isPalindrome)
        XCTAssertFalse(List(2, 2, 1, 2).isPalindrome)
        XCTAssertFalse(List(2, 2, 1, 3, 2).isPalindrome)
    }

}
