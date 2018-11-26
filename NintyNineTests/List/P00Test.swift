//
//  P00Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/14/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P00Test: XCTestCase {

    func testConvienceInit() {
        let list = List(1, 2, 3)
        
        XCTAssertEqual(1, list.value)
        XCTAssertEqual(2, list.nextItem?.value)
        XCTAssertEqual(3, list.nextItem?.nextItem?.value)
    }
    
    func testInit() {
        let list = List([1, 2, 3])
        
        XCTAssertEqual(1, list?.value)
        XCTAssertEqual(2, list?.nextItem?.value)
        XCTAssertEqual(3, list?.nextItem?.nextItem?.value)
    }
    
    func testInit_empty() {
        XCTAssertNil(List([]))
    }
}
