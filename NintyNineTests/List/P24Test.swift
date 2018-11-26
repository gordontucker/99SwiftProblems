//
//  P24Test.swift
//  NintyNineTests
//
//  Created by Gordon Tucker on 11/20/18.
//  Copyright © 2018 Gordon Tucker. All rights reserved.
//

import XCTest
import NintyNine

class P24Test: XCTestCase {

    func testLotto() {
        let lotto = List<Any>.lotto(count: 6, maximumValue: 50)
        print("Lotto: \(lotto.description)")
        XCTAssertEqual(6, lotto.count)
        XCTAssertEqualList([1], List<Any>.lotto(count: 1, maximumValue: 1))
    }

}
