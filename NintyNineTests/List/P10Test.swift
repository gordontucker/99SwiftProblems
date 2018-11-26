//
//  P10Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P10Test: XCTestCase {

    func testEncoded() {
        let encoded = List(1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5).encoded
        XCTAssertEqual(6, encoded.count)
        guard encoded.count == 6 else { return }
        XCTAssertEqual(4, encoded[0]?.0)
        XCTAssertEqual(1, encoded[0]?.1)
        XCTAssertEqual(1, encoded[1]?.0)
        XCTAssertEqual(2, encoded[1]?.1)
        XCTAssertEqual(2, encoded[2]?.0)
        XCTAssertEqual(3, encoded[2]?.1)
        XCTAssertEqual(2, encoded[3]?.0)
        XCTAssertEqual(1, encoded[3]?.1)
        XCTAssertEqual(1, encoded[4]?.0)
        XCTAssertEqual(4, encoded[4]?.1)
        XCTAssertEqual(4, encoded[5]?.0)
        XCTAssertEqual(5, encoded[5]?.1)
    }

}
