//
//  P23Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P23Test: XCTestCase {

    func testRemoveRandom() {
        var list = List("a", "b", "c", "d", "e", "f", "g", "h")
        var random = list.randomSelect(amount: 3)
        XCTAssertEqual(3, random?.count)
        print("Found random list: \(random!.description)")
        XCTAssertNil(list.randomSelect(amount: 0))
        XCTAssertNil(list.randomSelect(amount: -2))
        
        list = List("a")
        random = list.randomSelect(amount: 5)
        XCTAssertEqualList(["a"], random)
    }
}
