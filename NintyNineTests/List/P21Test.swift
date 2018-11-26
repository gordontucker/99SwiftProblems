//
//  P21Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P21Test: XCTestCase {

    func testInsertAt() {
        let list = List("a", "b", "c", "d")
        
        XCTAssertEqualList(["a", "b", "c", "d"], list.insert("new", at: -1))
        XCTAssertEqualList(["a", "b", "c", "d"], list.insert("new", at: 5))
        XCTAssertEqualList(["a", "b", "c", "d", "new"], list.insert("new", at: 4))
        XCTAssertEqualList(["a", "new", "b", "c", "d"], list.insert("new", at: 1))
        XCTAssertEqualList(["new", "a", "b", "c", "d"], list.insert("new", at: 0))
        XCTAssertEqualList(["a", "b", "c", "new", "d"], list.insert("new", at: 3))
    }

}
