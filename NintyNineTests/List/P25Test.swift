//
//  P25Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P25Test: XCTestCase {

    func testRandomPermute() {
        let random = List(1,2,3,4,5,6).randomPermute()
        print("random permute: \(random.description)")
        XCTAssertEqual(6, random.count)
        XCTAssertEqual(1, List(1).randomPermute().count)
    }
}
