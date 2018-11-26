//
//  P11Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/16/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P11Test: XCTestCase {

    func testEncodedModified() {
        let encoded = List(1, 1, 1, 1, 2, 3, 3, 1, 1, 4, 5, 5, 5, 5).encodedModified
        XCTAssertEqual(6, encoded.count)
        guard encoded.count == 6 else { return }
        XCTAssertEqual(4, (encoded[0] as? (Int, Int))?.0)
        XCTAssertEqual(1, (encoded[0] as? (Int, Int))?.1)
        XCTAssertEqual(2, encoded[1] as? Int)
        XCTAssertEqual(2, (encoded[2] as? (Int, Int))?.0)
        XCTAssertEqual(3, (encoded[2] as? (Int, Int))?.1)
        XCTAssertEqual(2, (encoded[3] as? (Int, Int))?.0)
        XCTAssertEqual(1, (encoded[3] as? (Int, Int))?.1)
        XCTAssertEqual(4, encoded[4] as? Int)
        XCTAssertEqual(4, (encoded[5] as? (Int, Int))?.0)
        XCTAssertEqual(5, (encoded[5] as? (Int, Int))?.1)
    }

}
